# This makefile downloads the csv files from the google sheet and then combines
# them into a single csv file. Because there is no version control, the
# downloaded csv files are checked into the repository, however it is strongly
# suggested that modifications to these files are done in the google sheet
# directly, re-downloaded and then checked into the repository.

#gid = 439082926
gid = 924433430

bsg_padring_bump_map.csv:
	wget -O $@ https://docs.google.com/spreadsheets/d/1Y9_alYplFAaYEyOfn0ZjZhyShEjAUsBRW6GoO1Jasl4/export?format=csv\&gid=$(gid)
	dos2unix $@

clean:
	rm -f bsg_padring_bump_map.csv

