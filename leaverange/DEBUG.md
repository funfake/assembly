# Assembly Debugging

## Resources
- [View the backtrace in gdb](https://askubuntu.com/questions/1349047/where-do-i-find-core-dump-files-and-how-do-i-view-and-analyze-the-backtrace-st)
- [Random SIGSEV StackOverflow post](https://stackoverflow.com/questions/68966767/filessearcher-program-program-received-signal-sigsegv-segmentation-fault)

## Get the core dumps
They are stored into `/var/lib/apport/coredump/` (assuming you are in the project base dir)
```
cp /var/lib/apport/coredump/{core_dump_name} .
```

## Compare with binary executable
We are using gdb to analyse our core dump alongside our binary executable.
```
gdb {executable} {path_to_core_dump}
```
Press enter and scroll to see when the program terminated and why.

Install gdb with `sudo apt install gdb`
