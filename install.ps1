# Install OpenSSL and Rustup using winget
Write-Output "Installing OpenSSL and Rustup..."
winget install --id OpenSSL.OpenSSL -e --silent
winget install --id Rustlang.Rustup -e --silent

# Update Rustup and add to PATH
Write-Output "Updating Rust..."
$env:Path += ';' + [System.Environment]::GetEnvironmentVariable('USERPROFILE') + '\.cargo\bin'
rustup update

# Download and unzip a file
Write-Output "Downloading and unpacking project..."
$zipUrl = "https://example.com/somefile.zip"  # Replace with actual URL
$zipPath = "$PWD\download.zip"
$extractPath = "$PWD\unzipped_dir"
iwr -useb $zipUrl -OutFile $zipPath
Expand-Archive -Path $zipPath -DestinationPath $extractPath

# Navigate to directory and run the project
Write-Output "Running project..."
cd $extractPath
cargo run
