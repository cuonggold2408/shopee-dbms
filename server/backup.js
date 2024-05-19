require('dotenv').config();  // Tải cấu hình từ file .env
const { exec } = require('child_process');
const cron = require('node-cron');
const fs = require('fs');
const path = require('path');

const dbUser = process.env.DB_USERNAME;
const dbPass = process.env.DB_PASSWORD;
const dbHost = process.env.DB_HOST;
const dbName = process.env.DB_NAME;

// Tạo hàm sao lưu
function performBackup() {
    // Create backup directory if it does not exist
    const backupPath = path.join(__dirname, 'backups');
    if (!fs.existsSync(backupPath)) {
        fs.mkdirSync(backupPath, { recursive: true });
    }

    // Format current date
    const date = new Date().toISOString().slice(0, 10);
    const backupFile = path.join(backupPath, `backup-${date}.sql`);

    // Lệnh Pgdump
    const command = `pg_dump -U ${dbUser} -h ${dbHost} -d ${dbName} -f ${backupFile}`;

    // Lệnh command
    exec(command, {
        env: {
            PGPASSWORD: dbPass 
        }
    }, (error, stdout, stderr) => {
        const logFile = path.join(__dirname, 'backup.log');
        const logMessage = (new Date()).toISOString() + ' - ';

        if (error) {
            const message = `Backup error: ${error.message}`;
            fs.appendFileSync(logFile, logMessage + message + '\n');
            console.error(message);
            return;
        }
        if (stderr) {
            const message = `Backup stderr: ${stderr}`;
            fs.appendFileSync(logFile, logMessage + message + '\n');
            console.log(message);
            return;
        }
        const successMessage = `Backup created successfully: ${backupFile}`;
        fs.appendFileSync(logFile, logMessage + successMessage + '\n');
        console.log(successMessage);

        // Xóa các file sao lưu cũ hơn 7 ngày
        deleteOldBackups(backupPath, 7);
    });
}

// Hàm xóa các bản sao lưu cũ hơn số ngày chỉ định
function deleteOldBackups(directory, days) {
    const logFile = path.join(__dirname, 'backup.log');
    const files = fs.readdirSync(directory);
    const now = new Date();

    files.forEach(file => {
        const filePath = path.join(directory, file);
        const stats = fs.statSync(filePath);
        const fileAgeInDays = (now - new Date(stats.mtime)) / (1000 * 60 * 60 * 24);

        if (fileAgeInDays > days) {
            fs.unlinkSync(filePath);
            const deleteMessage = `Deleted old backup: ${filePath}`;
            fs.appendFileSync(logFile, (new Date()).toISOString() + ' - ' + deleteMessage + '\n');
            console.log(deleteMessage);
        }
    });
}

// Lập lịch sao lưu hàng tuần vào lúc 2:00 sáng hàng ngày
cron.schedule('0 2 * * *', function() {
    console.log('Running a daily backup at 02:00 AM');
    performBackup();  // Gọi hàm sao lưu
});
