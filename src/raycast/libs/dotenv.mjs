import * as fs from 'fs';
import * as path from 'path';
import { fileURLToPath } from 'url';

// https://flaviocopes.com/fix-dirname-not-defined-es-module-scope/
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const envFilePath = path.resolve(__dirname, '../.env');
const envFileContent = fs.readFileSync(envFilePath, 'utf-8');

envFileContent.split('\n').forEach(line => {
    if (line.startsWith('#') || !line.includes('=')) {
        return;
    }
    const [key, value] = line.split('=');
    if (key && value) {
        process.env[key.trim()] = value.trim();
    }
});
