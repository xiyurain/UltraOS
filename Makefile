all: 
	# rustup target add riscv64gc-unknown-none-elf
	cd codes/user && make elf
	cd codes/os && make release BOARD=k210

env:
	rustup update
	cargo install cargo-binutils
	cd codes/fat32-fuse && sh qemu_fs.sh
	cd codes/os && make env

run:
	cd codes/user && make elf
	cd codes/os && make fat32
	cd codes/os && make run

runos:
	cd codes/os && make run

runsimple:
	cd codes/os && make runsimple

gdb:
	cd codes/os && make gdb

monitor:
	cd codes/os && make monitor

build:
	cd codes/os && make build

elf:
	cd codes/user && make elf

os:
	cd codes/os && make run
