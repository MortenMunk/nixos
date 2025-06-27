default:
    just --list

switch:
    @git add .
    @nh os switch .

boot:
    @git add .
    @nh os boot .
