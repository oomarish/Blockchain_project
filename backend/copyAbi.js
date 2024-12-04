const fs = require('fs');
const path = require('path');

// Get the source directory where the ABI file is generated (inside the backend)
const sourceDir = path.join(__dirname, 'build', 'contracts');  // backend/build/contracts

// Get the destination directory where you want to copy the ABI file (inside the frontend)
const destinationDir = path.join(__dirname, '..', 'frontend', 'assets', 'abi');  // frontend/assets/abi
// Ensure destination directory exists
if (!fs.existsSync(destinationDir)){
    fs.mkdirSync(destinationDir, { recursive: true });
}

// Read all files from the source directory
fs.readdirSync(sourceDir).forEach(file => {
  if (file.endsWith('.json')) {
    const sourceFile = path.join(sourceDir, file);
    const destinationFile = path.join(destinationDir, file);
    
    // Copy each JSON file
    fs.copyFileSync(sourceFile, destinationFile);
    console.log(`Copied ${file} to frontend/assets/abi/`);
  }
});