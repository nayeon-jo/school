accounts=[]
def readFile():
    global accounts
    infile = open('bank.txt','r')
    for line in infile:
        account={}
        #print(line.rstrip().split())
        account['id'], account['pwd'], account['money'] = line.rstrip().split()
        account['money'] = int(account['money'])
        accounts.append(account)
    infile.close()
    
def writeFile():
    global accounts
    outfile = open('bank.txt','w')
    for account in accounts:
        outfile.write("{} {} {}\n".format(account['id'],account['pwd'],account['money']))
    outfile.close()
    
def showLoginMenu():
    print("=== LogInMenu ===")
    print("1. 로그인")
    print("2. 회원가입")
    print("3. 종료")
    
def showBankMenu():
    print("=== Bank Menu ===")
    print("1. 입금")
    print("2. 출금")
    print("3. 조회")
    print("4. 로그아웃")
    
def bank(ids):
    for i in range(len(accounts)):
        if accounts[i]["id"] == ids :
            index = i
            break
    while True:
        showBankMenu()
        choice = int(input('선택:'))
        if choice == 1: # 입금
            money = int(input("Money:"))
            accounts[index]['money'] += money
        elif choice == 2: #출금
            money = int(input("Money:"))
            if money > accounts[index]['money']:
                print("금액이 부족해서 출금할 수 없습니다.")
            else:
                accounts[index]['money'] -= money
        elif choice == 3:
            print("Money:",accounts[index]['money'])
        elif choice == 4: #로그아웃
            break
        else:
            print("다시 입력하십시오")
    print('로그아웃 합니다.')
def login():
    idS = input("ID:")
    pwd = input("PWD:")
    check = False
    for account in accounts:
        if account["id"] == idS and account["pwd"] == pwd :            
            check = True
            bank(idS)
            break
    if check == False:
        print("아이디 패스워드를 다시 한번 확인해 주십시오")
        
    
def join():
    global accounts
    print('=== join ===')
    inputId = input("아이디 입력:")
    inputPwd = input("패스워드 입력:")
    choice = 3
    account = {}
    account['id'] = inputId
    account['pwd'] = inputPwd
    account['money'] = 1000
    
    accounts.append(account)

readFile()
while True:
    showLoginMenu()
    choice = int(input('선택:'))
    if choice == 1:
        login()
    elif choice == 2:
        join()
        #print(accounts)
    elif choice == 3:
        break
    else:
        print("다시 입력하십시오")
writeFile()
print('프로그램을 종료합니다.')
