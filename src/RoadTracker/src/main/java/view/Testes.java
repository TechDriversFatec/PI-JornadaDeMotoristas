package view;

import model.Funcionario;

public class Testes {

	public static void main (String[] args) {
		Funcionario funcionario = new Funcionario();
		
//		funcionario.cadastrarFilial("Filial B�rbara S.A. S�o Jos� dos Campos", "S�o Jos� dos Campos", "SP");
		
//		funcionario.cadastrarFuncionario("Ceci�lia Santos", "45832145692", "barbara234", "adm", 2);
		
		funcionario.alterarDadosFuncionario("Cec�lia Oliveira", "45832145692", "barbara147", "adm", 2); //n�o pode mudar o cpf, sen�o n�o encontra o registro

		
		
	}
	
}
