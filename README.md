# boosterconf2027

## Setup

Clone this repo.

### macOS (ARM CPU)

If you are using macOS and an ARM based CPU, here is a full setup that launches
a VM (debian/trixie 20260112-2355) and installs the required packages: https://github.com/ivarref/vibe/

### AMD64 CPUs (Linux, Windows, macOS)

The workshop recommends using debian/trixie 20260112-2355 as the base Linux VM.
Download, verify and extract and verify it:

```
$ curl -L "https://cloud.debian.org/images/cloud/trixie/20260112-2355/debian-13-nocloud-amd64-20260112-2355.tar.xz" -O

# Make sure no network errors occurred:
$ printf "%s  %s" "765890bb31a071be829a64d086923447476b94b9c02faecff80f787a7e261f2088449f94ce362e5cb752901b188c443a284cb91bc98991fdcf375beca4a54eb9" "debian-13-nocloud-amd64-20260112-2355.tar.xz" | shasum --algorithm 512 --check -
debian-13-nocloud-amd64-20260112-2355.tar.xz: OK

$ tar -xOf debian-13-nocloud-amd64-20260112-2355.tar.xz disk.raw > debian-13-nocloud-amd64-20260112-2355.raw
```

Boot `debian-13-nocloud-amd64-20260112-2355.raw` using [VirtualBox](https://www.virtualbox.org/).
Make sure this repository directory is shared with the VM guest.

Execute `sudo ./provision.sh` from this repo to install the required packages.

You should now be ready for the excercises!
