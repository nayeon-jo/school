# -*- coding: utf-8 -*-
"""
Created on Sun May 30 18:34:29 2021

@author: jony
"""


#3x3빙고
import random

tmp = [0]*9         #tmp=[[0,0,0],[0,0,0],[0,0,0]]
cnt = 1
while cnt<10:        #x번째 인덱스에 1~9를 순서대로 삽입
  x=random.randint(0,8)
  if tmp[x]==0:
    tmp[x]=cnt
    cnt+=1         

a= [[0,0,0],
    [0,0,0],
    [0,0,0]]
cnt=0
for i in range(0,3):
  for j in range(0,3):
      a[i][j]=tmp[cnt]
      cnt+=1
print("a: ",a)


tmp = [0]*9
cnt = 1
while cnt<10:
  x=random.randint(0,8)
  if tmp[x]==0:
    tmp[x]=cnt
    cnt+=1

b= [[0,0,0],
    [0,0,0],
    [0,0,0]]
cnt=0
for i in range(0,3):
  for j in range(0,3):
      b[i][j]=tmp[cnt]
      cnt+=1
print("b: ",b)



win=[]
exist=0
bingo=0
end=0
cnt=0
while cnt <9 and end==0:
  mc=int(input("1~9 사이 숫자 입력: "))
  for i in range(0,3):
    for j in range(0,3):
      if a[i][j]==mc:
        a[i][j]='ok'
        exist=1
      if b[i][j]==mc:
        b[i][j]='ok'
        exist=1
  if exist==1:
    cnt+=1
    exist=0
  else: 
    continue

 
  for j in range(0,3):
    if a[0][j]==a[1][j]:        #세로
      if a[1][j]==a[2][j]:
        bingo=1
    if a[j][0]==a[j][1]:        #가로   
      if a[j][1]==a[j][2]:
        bingo=1
        
  if a[0][0]==a[1][1]:          #대각선
     if a[1][1]==a[2][2]:
        bingo=1
        
  if a[0][2]==a[1][1]:           #대각선
     if a[1][1]==a[2][0]:
        bingo=1
        
  if bingo ==1:
    win.append("a")
    bingo=0
    end=1

  for j in range(0,3):
    if b[0][j]==b[1][j]:        #세로
      if b[1][j]==b[2][j]:
        bingo=1
    if b[j][0]==b[j][1]:        #가로
      if b[j][1]==b[j][2]:
        bingo=1
        
  if b[0][0]==b[1][1]:          #대각선
     if b[1][1]==b[2][2]:
        bingo=1
        
  if b[0][2]==b[1][1]:          #대각선
     if b[1][1]==b[2][0]:
        bingo=1
        
  if bingo ==1:
    win.append("b")
    bingo=0
    end=1
  
    
  print("a: ",a)
  print("b: ",b)
  
print("빙고!")
print(win,"가 이겼습니다!")