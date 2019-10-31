# Docker cron rotate backups

Uses [rotate-backups](https://rotate-backups.readthedocs.io/en/latest/) with a scheduled job to maintain a list of files limited to a given time range.

## Example in a Docker composition

```yml
version: "3"

services:
  rotate:
    image: glide/cron-rotate-backups:0.1
    build: .
    volumes:
      - ./backup:/data
    environment:
      ROTATE_CRON: "* * * * *"
      ROTATE_OPTIONS: "--daily=7 --weekly=4 --monthly=12 --yearly=2"
```

This will maintain files of a `backup` directory.  
It will keep one file for each last 7 days, 4 weeks, 12 months, 2 years and remove the other files.  
It will run every minutes to make sure the directory is up to date.  
Use `--dry-run` to check what would happen before to avoid loosing unexpected files.

See [rotate-backups doc](https://rotate-backups.readthedocs.io/en/latest/) for more informations
