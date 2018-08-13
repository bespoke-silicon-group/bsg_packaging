
export IMAGE_SCALE ?= 100
#export IMAGE_SCALE ?= 200
#export IMAGE_SCALE ?= 400

ifeq ($(IMAGE_SCALE),100)
export IMAGE_SIZE = 2300
else
ifeq ($(IMAGE_SCALE),200)
export IMAGE_SIZE = 4600
else
ifeq ($(IMAGE_SCALE),400)
export IMAGE_SIZE = 9200
endif
endif
endif

SCRIPT_DIR = scripts
IMG_DIR    = images/$(IMAGE_SCALE)
CSV_DIR    = ..
OUT_DIR    = output

PACKAGING_IMG       = $(IMG_DIR)/packaging.png
CHIP_DIE_IMG        = $(IMG_DIR)/chip_die.png
DIE_SUB_CSV         = $(CSV_DIR)/uw_bga_3x3_bsg_dram_to_substrate.csv
WIRE_BOND_INNER_PS  = $(OUT_DIR)/wire_bonds_inner.ps
WIRE_BOND_OUTER_PS  = $(OUT_DIR)/wire_bonds_outer.ps
WIRE_BOND_INNER_IMG = $(OUT_DIR)/wire_bonds_inner.png
WIRE_BOND_OUTER_IMG = $(OUT_DIR)/wire_bonds_outer.png
FINAL_INNER_IMG     = $(OUT_DIR)/final_inner.png
FINAL_OUTER_IMG     = $(OUT_DIR)/final_outer.png
FINAL_COMBINED_IMG  = $(OUT_DIR)/final_combined.png

all:
	$(MAKE) $(FINAL_INNER_IMG)
	$(MAKE) $(FINAL_OUTER_IMG)
	$(MAKE) $(FINAL_COMBINED_IMG)

PS_FILES = $(WIRE_BOND_INNER_PS) $(WIRE_BOND_OUTER_PS)
$(PS_FILES): $(SCRIPT_DIR)/draw_wire_bonds.py $(DIE_SUB_CSV)
	/usr/bin/python3 $(SCRIPT_DIR)/draw_wire_bonds.py --die_sub_csv_file $(DIE_SUB_CSV)    \
	                                                  --output_inner $(WIRE_BOND_INNER_PS) \
																										--output_outer $(WIRE_BOND_OUTER_PS)

$(WIRE_BOND_INNER_IMG): $(WIRE_BOND_INNER_PS)
	convert $(WIRE_BOND_INNER_PS) $@
	convert $@ -resize $(IMAGE_SIZE)x$(IMAGE_SIZE) $@
	convert $@ -transparent black $@

$(WIRE_BOND_OUTER_IMG): $(WIRE_BOND_OUTER_PS)
	convert $(WIRE_BOND_OUTER_PS) $@
	convert $@ -resize $(IMAGE_SIZE)x$(IMAGE_SIZE) $@
	convert $@ -transparent black $@

$(FINAL_INNER_IMG): $(CHIP_DIE_IMG) $(PACKAGING_IMG) $(WIRE_BOND_INNER_IMG)
	composite $(CHIP_DIE_IMG) $(PACKAGING_IMG) -gravity center $@
	composite $(WIRE_BOND_INNER_IMG) $@ $@

$(FINAL_OUTER_IMG): $(CHIP_DIE_IMG) $(PACKAGING_IMG) $(WIRE_BOND_OUTER_IMG)
	composite $(CHIP_DIE_IMG) $(PACKAGING_IMG) -gravity center $@
	composite $(WIRE_BOND_OUTER_IMG) $@ $@

$(FINAL_COMBINED_IMG): $(CHIP_DIE_IMG) $(PACKAGING_IMG) $(WIRE_BOND_INNER_IMG) $(WIRE_BOND_OUTER_IMG)
	composite $(CHIP_DIE_IMG) $(PACKAGING_IMG) -gravity center $@
	composite $(WIRE_BOND_INNER_IMG) $@ $@
	composite $(WIRE_BOND_OUTER_IMG) $@ $@

display_inner: $(FINAL_INNER_IMG)
	display $(FINAL_INNER_IMG)

display_outer: $(FINAL_OUTER_IMG)
	display $(FINAL_OUTER_IMG)
	
display_combined: $(FINAL_COMBINED_IMG)
	display $(FINAL_COMBINED_IMG)
	
clean:
	rm -rf $(OUT_DIR)

