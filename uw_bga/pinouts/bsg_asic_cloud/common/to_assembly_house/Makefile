
export IMAGE_SCALE ?= 300

ifeq ($(IMAGE_SCALE),300)
export IMAGE_SIZE = 4200
export DIE_SIZE   = 900
endif

SCRIPT_DIR = .
IMG_DIR    = .
CSV_DIR    = .
OUT_DIR    = output

PACKAGING_IMG    = $(IMG_DIR)/uw_bga_large.png
ALL_CSV          = $(CSV_DIR)/uw_bga_gf12.csv
CHIP_DIE_PS      = $(OUT_DIR)/uw_bga_gf12_die.ps
CHIP_DIE_IMG     = $(OUT_DIR)/uw_bga_gf12_die.png

SIGNAL_CSV       = $(CSV_DIR)/uw_bga_gf12_signal.csv
SIGNAL_WIRE_PS   = $(OUT_DIR)/uw_bga_gf12_signal.ps
SIGNAL_WIRE_IMG  = $(OUT_DIR)/uw_bga_gf12_signal.png
SIGNAL_FINAL_IMG = $(OUT_DIR)/uw_bga_gf12_signal_final.png

VDD_CSV          = $(CSV_DIR)/uw_bga_gf12_vdd.csv
VDD_WIRE_PS      = $(OUT_DIR)/uw_bga_gf12_vdd.ps
VDD_WIRE_IMG     = $(OUT_DIR)/uw_bga_gf12_vdd.png
VDD_FINAL_IMG    = $(OUT_DIR)/uw_bga_gf12_vdd_final.png
                 
V18_CSV          = $(CSV_DIR)/uw_bga_gf12_v18.csv
V18_WIRE_PS      = $(OUT_DIR)/uw_bga_gf12_v18.ps
V18_WIRE_IMG     = $(OUT_DIR)/uw_bga_gf12_v18.png
V18_FINAL_IMG    = $(OUT_DIR)/uw_bga_gf12_v18_final.png
                 
VSS_CSV          = $(CSV_DIR)/uw_bga_gf12_vss.csv
VSS_WIRE_PS      = $(OUT_DIR)/uw_bga_gf12_vss.ps
VSS_WIRE_IMG     = $(OUT_DIR)/uw_bga_gf12_vss.png
VSS_FINAL_IMG    = $(OUT_DIR)/uw_bga_gf12_vss_final.png

INNER_COMBINED_IMG = $(OUT_DIR)/uw_bga_gf12_inner_combined.png
ALL_COMBINED_IMG   = $(OUT_DIR)/uw_bga_gf12_all_combined.png

all:
	$(MAKE) $(SIGNAL_FINAL_IMG)
	$(MAKE) $(VDD_FINAL_IMG)
	$(MAKE) $(V18_FINAL_IMG)
	$(MAKE) $(VSS_FINAL_IMG)
	$(MAKE) $(INNER_COMBINED_IMG)
	$(MAKE) $(ALL_COMBINED_IMG)

$(CHIP_DIE_PS): $(ALL_CSV) $(SCRIPT_DIR)/draw_die.py
	python3 $(SCRIPT_DIR)/draw_die.py --die_sub_csv_file $(ALL_CSV) --output_file $@

$(CHIP_DIE_IMG): $(CHIP_DIE_PS)
	convert $(CHIP_DIE_PS) $@
	convert $@ -resize $(DIE_SIZE)x$(DIE_SIZE) $@

$(SIGNAL_WIRE_PS): $(SCRIPT_DIR)/draw_wire_bonds.py $(SIGNAL_CSV) $(CHIP_DIE_IMG) $(PACKAGING_IMG)
	python3 $(SCRIPT_DIR)/draw_wire_bonds.py --die_sub_csv_file $(SIGNAL_CSV) --output_file $@

$(SIGNAL_WIRE_IMG): $(SIGNAL_WIRE_PS)
	convert $(SIGNAL_WIRE_PS) $@
	convert $@ -resize $(IMAGE_SIZE)x$(IMAGE_SIZE) $@
	convert $@ -transparent black $@

$(SIGNAL_FINAL_IMG): $(SIGNAL_WIRE_IMG)
	composite $(CHIP_DIE_IMG) $(PACKAGING_IMG) -gravity center $@
	composite $(SIGNAL_WIRE_IMG) $@ $@



$(VDD_WIRE_PS): $(SCRIPT_DIR)/draw_wire_bonds.py $(VDD_CSV) $(CHIP_DIE_IMG) $(PACKAGING_IMG)
	python3 $(SCRIPT_DIR)/draw_wire_bonds.py --die_sub_csv_file $(VDD_CSV) --output_file $@

$(VDD_WIRE_IMG): $(VDD_WIRE_PS)
	convert $(VDD_WIRE_PS) $@
	convert $@ -resize $(IMAGE_SIZE)x$(IMAGE_SIZE) $@
	convert $@ -transparent black $@

$(VDD_FINAL_IMG): $(VDD_WIRE_IMG)
	composite $(CHIP_DIE_IMG) $(PACKAGING_IMG) -gravity center $@
	composite $(VDD_WIRE_IMG) $@ $@



$(V18_WIRE_PS): $(SCRIPT_DIR)/draw_wire_bonds.py $(V18_CSV) $(CHIP_DIE_IMG) $(PACKAGING_IMG)
	python3 $(SCRIPT_DIR)/draw_wire_bonds.py --die_sub_csv_file $(V18_CSV) --output_file $@

$(V18_WIRE_IMG): $(V18_WIRE_PS)
	convert $(V18_WIRE_PS) $@
	convert $@ -resize $(IMAGE_SIZE)x$(IMAGE_SIZE) $@
	convert $@ -transparent black $@

$(V18_FINAL_IMG): $(V18_WIRE_IMG)
	composite $(CHIP_DIE_IMG) $(PACKAGING_IMG) -gravity center $@
	composite $(V18_WIRE_IMG) $@ $@



$(VSS_WIRE_PS): $(SCRIPT_DIR)/draw_wire_bonds.py $(VSS_CSV) $(CHIP_DIE_IMG) $(PACKAGING_IMG)
	python3 $(SCRIPT_DIR)/draw_wire_bonds.py --die_sub_csv_file $(VSS_CSV) --output_file $@

$(VSS_WIRE_IMG): $(VSS_WIRE_PS)
	convert $(VSS_WIRE_PS) $@
	convert $@ -resize $(IMAGE_SIZE)x$(IMAGE_SIZE) $@
	convert $@ -transparent black $@

$(VSS_FINAL_IMG): $(VSS_WIRE_IMG)
	composite $(CHIP_DIE_IMG) $(PACKAGING_IMG) -gravity center $@
	composite $(VSS_WIRE_IMG) $@ $@



$(INNER_COMBINED_IMG): $(CHIP_DIE_IMG) $(PACKAGING_IMG) $(VDD_WIRE_IMG) $(V18_WIRE_IMG) $(VSS_WIRE_IMG)
	composite $(CHIP_DIE_IMG) $(PACKAGING_IMG) -gravity center $@
	composite $(VDD_WIRE_IMG) $@ $@
	composite $(V18_WIRE_IMG) $@ $@
	composite $(VSS_WIRE_IMG) $@ $@

$(ALL_COMBINED_IMG): $(SIGNAL_FINAL_IMG) $(INNER_COMBINED_IMG)
	composite $(SIGNAL_FINAL_IMG) $(INNER_COMBINED_IMG) $@



display_signal: $(SIGNAL_FINAL_IMG)
	display $(SIGNAL_FINAL_IMG)
    
display_vdd: $(VDD_FINAL_IMG)
	display $(VDD_FINAL_IMG)
    
display_v18: $(V18_FINAL_IMG)
	display $(V18_FINAL_IMG)
    
display_vss: $(VSS_FINAL_IMG)
	display $(VSS_FINAL_IMG)
	
clean:
	rm -rf $(OUT_DIR)

