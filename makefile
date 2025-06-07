ARQ_TESTE = testbench.v
FONTE = Fonte/

ARQ_SAIDA = testbench
ARQ_VCD = testbench.vcd

all: exe

exe: $(ARQ_SAIDA)
	@ vvp $(SAIDA) $(ARQ_SAIDA)

$(ARQ_SAIDA): 
	@ iverilog -I$(FONTE) $(ARQ_TESTE) -o $(ARQ_SAIDA) 

wave: $(ARQ_SAIDA)
	@ gtkwave $(ARQ_VCD)

clean: 
	rm $(ARQ_SAIDA) $(ARQ_VCD)