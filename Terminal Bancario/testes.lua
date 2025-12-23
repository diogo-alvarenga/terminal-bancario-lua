local Conta = require("conta")
local Banco = require("banco")

print("=== Iniciando Testes ===")

-- Test1: Criacao de Contas  
local conta = Conta:new("Usuario","123",100)
assert(conta.usuario == "Usuario", "Erro: Nome de usuario incorreto")
assert(conta.senha == "123", "Erro: Senha de usuario incorreta")
assert(conta.saldo == 100, "Erro: Saldo de usuario incorreto")

-- Teste2: Verificar Senha
assert(conta:verificarSenha("123")== true, "Erro!")
assert(conta:verificarSenha("errada")== false, "Erro!")

-- Teste3: Depositar 
local saldoAntes = conta.saldo 
conta.depositar = function (self)
    self.saldo = self.saldo +50
end
conta:depositar()
assert(conta.saldo == saldoAntes+50,"Erro!")

-- Teste4: Sacar 
conta.sacar = function (self)
    self.saldo = self.saldo -50
end
local saldoAntes = conta.saldo
conta:sacar()
assert(conta.saldo == saldoAntes-50,"Erro!")

-- Teste5: Banco - Criar e acessar conta 
local banco = Banco:new()
banco.contas["joao"] = Conta:new("joao","123",200)
assert(banco.contas["joao"]:verificarSenha("123")==true,"Erro!")

print("Testes realizados com exito")