# Description

* Simple script used for converting images taken on iPhone to be readable on a Windows device.
  * Takes the .HEIC iPhone images and converts them to universally readable .PNG
* Also updates the creation date to the last modified date, so that photos saved from someone else no longer have a creation date later than their last modified date (i.e. now has the true creation date) 
  * It then renames files to their datetime such that they can be alphanumerically sorted in order (year-months-days_hours/minutes/seconds)
* To ensure nothing is lost in case a conversion is corrupted, the original files are moved to a backup directory (with original names + extension)

# Motivation

* Wanted to print physical copies of iPhone images, but encountered 2 problems:
  * 1. the website I used couldn't print .HEIC so they had to be converted to a supported file type e.g. .PNG
  * 2. the website sorted images alphanumerically, so with the original names they were unordered and it was difficult to select the photos I wanted


* Made public in case others may find this useful

# Usage Instructions

* Simply downoad HeicToPng.ps1 into the directory that contains the images you wish to convert, then double click on the script to run it.
