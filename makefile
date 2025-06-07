ARQ_TESTE = testbench.v
FONTE = Fonte/

ARQ_SAIDA = testbench
ARQ_VCD = testbench.vcd

all: $(ARQ_VCD)

$(ARQ_VCD): $(ARQ_SAIDA)
	@ vvp $(ARQ_SAIDA)

$(ARQ_SAIDA): 
	@ iverilog -I$(FONTE) $(ARQ_TESTE) -o $(ARQ_SAIDA) 

wave: $(ARQ_SAIDA) $(ARQ_VCD)
	@ gtkwave $(ARQ_VCD)

clean: 
	rm $(ARQ_SAIDA) $(ARQ_VCD)