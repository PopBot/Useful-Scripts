# Define the base directory
$BASE_DIR = [Environment]::GetFolderPath("Desktop")

# Define the archive directory
$ARCHIVE_DIR = Join-Path -Path $BASE_DIR -ChildPath "Archive"

# Get the current date
$CURRENT_DATE = Get-Date -Format "MM-dd-yyyy"

# Get the current month and year
$CURRENT_MONTH_YEAR = Get-Date -Format "MMMM-yyyy"

# Create the Archive directory if it doesn't exist
if (!(Test-Path -Path $ARCHIVE_DIR)) {
    New-Item -ItemType Directory -Path $ARCHIVE_DIR | Out-Null
}

# Create the month-year directory if it doesn't exist
$MONTH_YEAR_DIR = Join-Path -Path $ARCHIVE_DIR -ChildPath $CURRENT_MONTH_YEAR
if (!(Test-Path -Path $MONTH_YEAR_DIR)) {
    New-Item -ItemType Directory -Path $MONTH_YEAR_DIR | Out-Null
}

# Create the date directory if it doesn't exist
$DATE_DIR = Join-Path -Path $MONTH_YEAR_DIR -ChildPath $CURRENT_DATE
if (!(Test-Path -Path $DATE_DIR)) {
    New-Item -ItemType Directory -Path $DATE_DIR | Out-Null
}

# Move all files and directories from the Desktop to the date directory
Get-ChildItem -Path $BASE_DIR -Exclude "Archive" | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $DATE_DIR
}
