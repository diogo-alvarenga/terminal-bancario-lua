local Conta = {}

Conta.__index = Conta

function Conta:new(usuario,senha,saldo)
    local self = setmetatable({}, Conta)
    self.usuario = usuario 
    self.senha = senha 
    self.saldo = saldo or 0
    return self
end

function Conta:verificarSenha(senha)
    return self.senha == senha
end

function Conta:menu()
    while true do
        print("\n=== Conta de "..self.usuario.." ===")
        print("1. Ver Saldo")
        print("2. Depositar")
        print("3. Sacar")
        print("4. Sair")
        io.write("Escolha uma opcao: ")
        local escolha = io.read("*n")
        io.read()

        if escolha ==1 then
            self:verSaldo()         
        elseif escolha ==2 then
            self:depositar()
        elseif escolha ==3 then
            self:sacar()
        elseif escolha ==4 then
            print("Saindo da conta...")
            break
        else
            print("Opcao invalida!")
        end
    end
end

function Conta:verSaldo()
    print("Saldo Atual: R$"..self.saldo)
end

function Conta:depositar()
    io.write("Valor para deposito: ")
    local valor = tonumber(io.read())
    if valor and valor> 0 then
        self.saldo = self.saldo + valor
        print("Deposito realizado com sucesso")
    else
        print("Valor invalido!")
    end
end

function Conta:sacar()
    io.write("Valor para levantar: ")
    local valor = tonumber(io.read())
    if valor and valor >0 and valor<= self.saldo then
        self.saldo = self.saldo - valor 
        print("Saque realizado com sucesso")
    else
        print("Saldo insuficiente ou valor invalido")
    end
end

return Conta