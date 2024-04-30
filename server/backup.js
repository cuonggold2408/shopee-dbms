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

    // Construct the pg_dump command using environment variables
    const command = `pg_dump -U ${dbUser} -h ${dbHost} -d ${dbName} -f ${backupFile}`;

    // Execute the command
    exec(command, {
        env: {
            PGPASSWORD: dbPass  // Pass the DB password to the environment variable
        }
    }, (error, stdout, stderr) => {
        if (error) {
            console.error(`Backup error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.log(`Backup stderr: ${stderr}`);
            return;
        }
        console.log(`Backup created successfully: ${backupFile}`);
    });
}

// Lập lịch sao lưu hàng ngày vào lúc 2:00 sáng
cron.schedule('0 2 * * *', function() {
    console.log('Running a daily backup at 02:00 AM');
    performBackup();  // Gọi hàm sao lưu
});
