
export IMAGE_SCALE ?= 300

ifeq ($(IMAGE_SCALE),300)
export IMAGE_SIZE = 4600
export DIE_SIZE   = 1500
endif

FOUNDRY ?= gf_14_invecas_1p8v

SCRIPT_DIR       = ./py
IMG_DIR          = ./png
COMMON_CSV_DIR   = ./csv
FOUNDRY_CSV_DIR := ../../$(FOUNDRY)/csv
OUT_DIR         := ./output/$(FOUNDRY)

PACKAGING_IMG    = $(IMG_DIR)/ucsd_bga_332_large.png
PACKAGING_CSV    = $(COMMON_CSV_DIR)/ucsd_bga_332_substrate.csv

CHIP_DIE_PS      = $(OUT_DIR)/ucsd_bga_332_die.ps
CHIP_DIE_IMG     = $(OUT_DIR)/ucsd_bga_332_die.png

ALL_PADS_CSV       = $(OUT_DIR)/ucsd_bga_332_all.csv
ALL_PADS_WIRE_PS   = $(OUT_DIR)/ucsd_bga_332_all_wire.ps
ALL_PADS_WIRE_IMG  = $(OUT_DIR)/ucsd_bga_332_all_wire.png
ALL_PADS_FINAL_IMG = $(OUT_DIR)/ucsd_bga_332_all_final.png

SIGNAL_PADS_CSV       = $(OUT_DIR)/ucsd_bga_332_signal.csv
SIGNAL_PADS_WIRE_PS   = $(OUT_DIR)/ucsd_bga_332_signal_wire.ps
SIGNAL_PADS_WIRE_IMG  = $(OUT_DIR)/ucsd_bga_332_signal_wire.png
SIGNAL_PADS_FINAL_IMG = $(OUT_DIR)/ucsd_bga_332_signal_final.png

SUPPLY_PADS_CSV       = $(OUT_DIR)/ucsd_bga_332_supply.csv
SUPPLY_PADS_WIRE_PS   = $(OUT_DIR)/ucsd_bga_332_supply_wire.ps
SUPPLY_PADS_WIRE_IMG  = $(OUT_DIR)/ucsd_bga_332_supply_wire.png
SUPPLY_PADS_FINAL_IMG = $(OUT_DIR)/ucsd_bga_332_supply_final.png

VDD_PADS_CSV       = $(OUT_DIR)/ucsd_bga_332_vdd.csv
VDD_PADS_WIRE_PS   = $(OUT_DIR)/ucsd_bga_332_vdd_wire.ps
VDD_PADS_WIRE_IMG  = $(OUT_DIR)/ucsd_bga_332_vdd_wire.png
VDD_PADS_FINAL_IMG = $(OUT_DIR)/ucsd_bga_332_vdd_final.png

V33_PADS_CSV       = $(OUT_DIR)/ucsd_bga_332_v33.csv
V33_PADS_WIRE_PS   = $(OUT_DIR)/ucsd_bga_332_v33_wire.ps
V33_PADS_WIRE_IMG  = $(OUT_DIR)/ucsd_bga_332_v33_wire.png
V33_PADS_FINAL_IMG = $(OUT_DIR)/ucsd_bga_332_v33_final.png

VSS_VZZ_PADS_CSV       = $(OUT_DIR)/ucsd_bga_332_vss_vzz.csv
VSS_VZZ_PADS_WIRE_PS   = $(OUT_DIR)/ucsd_bga_332_vss_vzz_wire.ps
VSS_VZZ_PADS_WIRE_IMG  = $(OUT_DIR)/ucsd_bga_332_vss_vzz_wire.png
VSS_VZZ_PADS_FINAL_IMG = $(OUT_DIR)/ucsd_bga_332_vss_vzz_final.png

.SECONDARY:

#DISPLAY_CMD = display
DISPLAY_CMD = firefox

# can run "$ make -j7" to generate all images in parallel
all: $(ALL_PADS_FINAL_IMG)    \
     $(SIGNAL_PADS_FINAL_IMG) \
     $(SUPPLY_PADS_FINAL_IMG) \
     $(VDD_PADS_FINAL_IMG)    \
     $(V33_PADS_FINAL_IMG)    \
     $(VSS_VZZ_PADS_FINAL_IMG)

display_all_pads: $(ALL_PADS_FINAL_IMG)
	$(DISPLAY_CMD) $<

display_signal_pads: $(SIGNAL_PADS_FINAL_IMG)
	$(DISPLAY_CMD) $<

display_supply_pads: $(SUPPLY_PADS_FINAL_IMG)
	$(DISPLAY_CMD) $<

display_vdd_pads: $(VDD_PADS_FINAL_IMG)
	$(DISPLAY_CMD) $<

display_vss_vzz_pads: $(VSS_VZZ_PADS_FINAL_IMG)
	$(DISPLAY_CMD) $<

display_v33_pads: $(V33_PADS_FINAL_IMG)
	$(DISPLAY_CMD) $<

$(OUT_DIR)/ucsd_bga_332_%_final.png: $(OUT_DIR)/ucsd_bga_332_%_wire.png $(CHIP_DIE_IMG)
	composite $(CHIP_DIE_IMG) $(PACKAGING_IMG) -gravity center $@
	composite $< $@ -gravity center $@

$(OUT_DIR)/ucsd_bga_332_%_wire.png: $(OUT_DIR)/ucsd_bga_332_%_wire.ps
	convert $< $@
	convert $@ -resize $(IMAGE_SIZE)x$(IMAGE_SIZE) $@
	convert $@ -transparent black $@

$(OUT_DIR)/ucsd_bga_332_%_wire.ps: $(OUT_DIR)/ucsd_bga_332_%.csv
	python3 $(SCRIPT_DIR)/draw_wire_bonds.py --die_sub_csv_file $< --output_file $@

$(OUT_DIR)/ucsd_bga_332_%.csv: $(FOUNDRY_CSV_DIR)/%_pads.csv
	mkdir -p $(@D)
	python3 $(SCRIPT_DIR)/merge_csv.py $(PACKAGING_CSV) $< > $@

$(CHIP_DIE_IMG): $(CHIP_DIE_PS)
	convert $(CHIP_DIE_PS) $@
	convert $@ -resize $(DIE_SIZE)x$(DIE_SIZE) $@

$(CHIP_DIE_PS): $(ALL_PADS_CSV)
	python3 $(SCRIPT_DIR)/draw_die.py --die_sub_csv_file $< --output_file $@

clean:
	rm -rf $(OUT_DIR)

