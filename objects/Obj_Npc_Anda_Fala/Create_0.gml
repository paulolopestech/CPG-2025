Player = Obj_Player;
	
i = 0;

destino_x[0] = 0;
destino_y[0] = 0;

Frente = Spr_Homem_de_Terno_Frente_Para;
Tras = Spr_Homem_de_Terno_Tras;
Lado = Spr_Homem_de_Terno_Frente_Para;

FrenteStop = Spr_Homem_de_Terno_Frente;
TrasStop = Spr_Homem_de_Terno_Tras_Para;
LadoStop = Spr_Homem_de_Terno_Frente;

flag = 0;

depthInicial = 0;

caminho = path_add();