:: Executa o script com privilégios de administrador
:: Verifica se o script está sendo executado como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Por favor, execute este script como Administrador!
    pause
    exit
)

:: Ativa a conta de Administrador
net user Administrador /active:yes

:: Solicita a definição da senha
echo Defina uma senha para o Administrador:
net user Administrador *

:: Mensagem de confirmação
echo Conta de Administrador ativada e senha definida com sucesso!
pause

control userpasswords2
pause 
