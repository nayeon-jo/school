import random
infile = open("hangman.txt","r")
words = infile.readlines()
infile.close()
word = random.choice(words).rstrip()
answer = list(word)
example = list('_' * len(answer))
print(answer)
cnt = 10

while cnt > 0:
    guess = input("추측해 보세요:")
    cnt -= 1

    i = 0
    for char in answer:
        if char == guess:
            example[i] = guess
        i += 1
    print(example)

    if answer == example:
        print('성공')
        break
if cnt == 0:
    print("실패")

