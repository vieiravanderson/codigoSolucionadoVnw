programa {

  //Explicação Funcionamento do Código:

  //O código inicialmente funcionava como um banco, onde voce gerava um usuário, acessava com o mesmo e assim poderia 
  //fazer suas transações como saques, depositos, extratos e até mesmo simular o câmbio de moedas internacionais.
  //Atualmente o código se encontra com problemas de falta de atenção dos desenvolvedores do mesmo, onde não souberam administrar boas praticas ao reescreve-lo.

  inclua biblioteca Util --> u
  inclua biblioteca Texto --> t
  inclua biblioteca Matematica --> mat

  real valor1, convert, saque, deposito, saldo = 0.0
  cadeia usuario, usuarioCheck, senha, senhaCheck, moeda
  inteiro cadastroCheck, tentativas = 2, opcao, moeda1, moeda2, valor2

  funcao inicio(){
    escreva("Login VNW Bank!\n")
    Cadastro()
  }
  
  funcao Cadastro(){
    escreva("Olá, seja bem vindo(a) ao VNW Bank!\n")
    u.aguarde(2000)
    escreva("Voce já tem um cadastro?\n")
    escreva("\n 1- Não")
    escreva("\n 2- Sim \n")
    leia(cadastroCheck)
    limpa()
    
    escolha(cadastroCheck){
      caso 1:
        escreva("Vamos cadastrar um novo usuário para você!\n")
        escreva("Escreva seu nome de usuário:\n")
        leia(usuario)
        escreva("Confirme seu nome de usuário:\n")
        leia(usuarioCheck)
        enquanto(usuarioCheck != usuario){
          escreva("Os nomes de usuario não coincidem, tente novamente!\n")
          escreva("Confirme seu nome de usuário:\n")
          leia(usuarioCheck)
         }
          u.aguarde(1300)
          escreva("Escreva sua senha: \n")
          leia(senha)
          escreva("Confirme sua senha: \n")
          leia(senhaCheck)
          enquanto(senhaCheck != senha){
          escreva("As senhas não coincidem, tente novamente!\n")
          escreva("Confirme sua senha: \n")
          leia(senhaCheck)
          }
        u.aguarde(1500)
        Acesso()
        pare
      caso 2: 
        Acesso()
      pare
 }
  }

  funcao Acesso(){
    limpa()
    escreva("Você está na área de acesso.\n")
    u.aguarde(1000)
    escreva("Escreva seu usuario:\n")
    leia(usuario)
    escreva("Escreva sua senha:\n")
    leia(senha)
    limpa()
    enquanto(senha != senhaCheck){
      se(tentativas==0){
        usuarioBloqueado()
      }
      escreva("Usuario ou senha incorretos\n")
      u.aguarde(1600)
      limpa()
      escreva("Você tem mais ", tentativas, " tentativas.\n")
      u.aguarde(800)
      escreva("Escreva seu usuario:\n")
      leia(usuario)
      escreva("Escreva sua senha:\n")
      leia(senha)
      limpa()
      tentativas--
    }
    u.aguarde(1600)
    limpa()
    menu()
  }

  funcao usuarioBloqueado(){
    escreva("Seu usuário foi bloqueado, crie um novo usuário ou tente novamente em 72 horas.\n")
    u.aguarde(3500)
    limpa()
    tentativas=2
    inicio()
  }

  funcao menu(){
    escreva("BEM VINDO(A) AO BANCO VNW!\n")
    u.aguarde(1000)
    escreva("Escolha uma das opções numéricas:")
    escreva("\n1) Depósito.")
    escreva("\n2) Saque.")
    escreva("\n3) Consulta.")
    escreva("\n4) Câmbio de Moedas.")
    escreva("\n5) Sair. \n")
      
    leia(opcao) 
    u.aguarde(1200)
    operacao() 
  }

  funcao operacao(){ 
    limpa()
    escolha (opcao){ 
      caso 1: depositar()
      pare 
      caso 2: sacar()
      pare
      caso 3: consultar()
      pare
      caso 4: cambio()
      pare
      caso 5: confirma() //aqui estava a função sair 
      pare
      caso contrario: error()
    }
  }
  
  funcao depositar(){
    escreva("Digite o valor que deseja depositar: \n")
    leia(deposito)
    saldo = saldo + deposito 
    escreva("Valor depositado com sucesso!\n")
    u.aguarde(1500)
    limpa()
    menu()
  }

  funcao sacar(){
     escreva("Digite o valor do saque: \n")
      leia(saque)
      se (saque <= 0){
        escreva("Digite um valor válido.\n")
        u.aguarde(1500)
        sacar()
      }
      se(saque > saldo){
        escreva("Seu saldo é insuficiente.\n")
      } 
      senao {
      saldo=saldo - saque 
        escreva("Valor sacado com sucesso!")
      }
      u.aguarde(1500)
      limpa()
      menu()
  }

  funcao consultar(){
      escreva("Seu saldo é de: R$", saldo)
      u.aguarde(1000)
      escreva("\nEstamos te redirecionando..\n")
      u.aguarde(2500)
      limpa()
      menu()
  }


  funcao error(){
      escreva("Escolha uma opção válida.\n")      
      u.aguarde(1500)
      limpa()
      menu()
  }


  funcao sair(){
      escreva("Volte sempre! Banco VNW agradece por sua presença.")
      u.aguarde(500)
      escreva("\nfechando...")
      u.aguarde(1500)
      limpa()
  }


  funcao cambio(){
    Moeda1()
    Valor1()  
    Moeda2()
    Converter()
  }

  funcao Moeda1(){
    
    escreva("Escolha a sua moeda:\n")
    escreva("1- Real\n")
    escreva("2- Dollar\n")
    escreva("3- Euro\n")
    escreva("4- Kwanza\n")
    leia(moeda1)
    limpa()
  }
  funcao Valor1(){
    escreva("Qual valor desejas converter? \n")
    leia(valor1) 
    limpa()
  }

  funcao Moeda2(){
    escreva("Escolha a moeda de conversão:\n")
    escreva("1- Real\n")
    escreva("2- Dollar\n")
    escreva("3- Euro\n")
    escreva("4- Kwanza\n")
    leia(moeda2)
    limpa()
  }

  funcao Converter(){
    escolha(moeda1){
      caso 1: escolha(moeda2){
        caso 1:convert = valor1 * 1.00
        moeda ="R$ "
        pare
        caso 2:convert = valor1 * 0.20
        moeda ="US$ "
        pare
        caso 3:convert = valor1 * 0.19
        moeda ="€ "
        pare
        caso 4:convert = valor1 * 170.24 
        moeda ="KZ "
      }
      pare
      

      caso 2: escolha(moeda2){ 
        caso 1:convert = valor1 * 4.86
        moeda ="R$"
        pare
        caso 2:convert = valor1 * 1
        moeda ="US$"
        pare
        caso 3:convert = valor1 * 0.93
        moeda ="€"
        pare
        caso 4:convert = valor1 * 829
        moeda ="KZ"
      }
      pare

    caso 3: escolha(moeda2){  
      caso 1: convert = valor1 * 5.19
      moeda ="R$ "
      pare
      caso 2: convert = valor1 * 1.06
      moeda ="US$ "
      pare
      caso 3: convert = valor1 * 1.00
      moeda ="€ "
      pare
      caso 4: convert = valor1 * 884.70 
      moeda ="KZ "
    } 
    pare     
      caso 4:  escolha(moeda2){ 
      	        
        caso 1:convert = valor1 * 0.0058
        moeda = "R$ "
        pare
        caso 2:convert = valor1 * 0.0012
        moeda ="US$ "
        pare
        caso 3:convert = valor1 * 0.0011
        moeda ="€ "
        pare
        caso 4:convert = valor1 * 1.00 
        moeda = "KZ "
      }
      pare
    }   
    convert = mat.arredondar(convert, 2) 
    escreva("O valor convertido fica em : ", moeda, convert)
    u.aguarde(30000) 
    limpa()
    menu()
  }

  funcao confirma(){
    escreva("Voce deseja voltar para o menu inicial ou sair do sistema?")
    escreva("\n1- Menu Inicial ")
    escreva("\n2- Sair \n")
    leia(opcao)

    escolha(opcao){
      caso 1: 
      menu()
      pare
      caso 2: 
      sair()
      pare
    }
}
}