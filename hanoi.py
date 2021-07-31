# -*- coding: utf-8 -*-
"""
Created on Thu Jun 10 12:51:14 2021

@author: jony
"""

def hanoi(n,f,b,t):
    if n==1:
        print(n,":",f,"->",t)
        return
    hanoi(n-1,f,t,b)
    print(n,":",f,"->",t)
    hanoi(n-1,b,f,t)
    
hanoi(4,"f","b","t")