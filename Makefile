compile:
	arduino-cli compile --fqbn m5stack:esp32:m5stack_cardputer -e --build-property build.partitions=huge_app --build-property upload.maximum_size=3145728 ./hs-nemo.ino && esptool.py --chip esp32s3 merge_bin --output build/m5stack.esp32.m5stack_cardputer/HS-NEMO.bin 0x0000 build/m5stack.esp32.m5stack_cardputer/hs-nemo.ino.bootloader.bin 0x8000 build/m5stack.esp32.m5stack_cardputer/hs-nemo.ino.partitions.bin 0x10000 build/m5stack.esp32.m5stack_cardputer/hs-nemo.ino.bin

flash:
	esptool.exe write_flash -z 0 build/m5stack.esp32.m5stack_cardputer/HS-NEMO.bin

.PHONY: compile