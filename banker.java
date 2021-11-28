package org.code.test;

import java.util.Scanner;

public class banker {
		private static int need[][];
		private static int alloc[][];
		private static int max[][];
		private static int avail[][];
		private static int p;
		private static int r; 

		private static void input() {
			Scanner sc=new Scanner(System.in);
			System.out.print("Number of processes and resources: ");
			p=sc.nextInt();  	//프로세스 수 
			r=sc.nextInt();		//자원 수
			need=new int[p][r]; //배열
			max=new int[p][r];
			alloc=new int[p][r];
			avail=new int[p][r];
			
			System.out.println("Alloc Matrix: ");
			for(int i=0; i<p; i++)
				for(int j=0; j<r; j++)
					alloc[i][j]=sc.nextInt();  //allocation matrix
			
			System.out.println("Max Matrix: ");
			for(int i=0; i<p; i++)
				for(int j=0; j<r; j++)
					max[i][j]=sc.nextInt();  //max matrix
			
			System.out.println("Avail Matrix: ");
			for(int j=0; j<r; j++)
				avail[0][j]=sc.nextInt();  //available matrix
			
			sc.close();
		}
		
		private static int[][] getNeed(){
			for(int i=0; i<p; i++)
				for(int j=0; j<r; j++)  
					need[i][j]=max[i][j]-alloc[i][j];  //calculate need matrix
			return need;
		}
		
		private static boolean check(int i) {
			for(int j=0; j<r; j++)
				if(avail[0][j]<need[i][j])
					return false;
			return true;
		}
		
		public static void main(String[] args) {
			input();
			getNeed();
			boolean done[]=new boolean[p];
			int j=0;
			
			while(j<p) {
				boolean allocated=false;
				for(int i=0; i<p; i++)
					if(!done[i] && check(i)) {
						for(int k=0; k<r; k++)
						avail[0][k]=avail[0][k]-need[i][k]+max[i][k];
					System.out.println("Allocated process: "+i);
					allocated=done[i]=true;
					j++;
					}
				if(!allocated) break;
			}
			if(j==p)
				System.out.println("\n Safe allocated");
			else
				System.out.println("All processes can't be allocated safely");
		}
}
