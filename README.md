# Fedora Prime

Yet another basic implementation of prime switching for Fedora, heavily influenced by the nvidia-prime package on Ubuntu.

## Background

After changing from Ubuntu to Fedora, I frustratingly attempted to get the Optimus setup for my HP ZBook Studio x360 G5 working.  After reinstalling Ubuntu and playing around with the nvidia-prime and ubuntu-drivers-common package, I had a basic understanding of what was required to get Optimus working.

So, I created some basic scripts and config files to handle this process.

## Installation

Tested and working on Fedora **30**, with the negativo17 nvidia drivers.

* Install fedora-prime:
```
sudo make install
```

## Usage

# To switch to onboard intel
sudo prime-select intel

# To switch to dedicated nvidia GPU
sudo prime-select nvidia

Now just log out and back in.
