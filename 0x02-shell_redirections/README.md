# 0x02. Shell, I/O Redirections and filters

# Resources

Read or watch:

* Shell, I/O Redirection

* Special Characters



# man or help:



* echo

* cat

* head

* tail

* find

* wc

* sort

* uniq

* grep

* tr

* rev

* cut

* passwd (5) (i.e. man 5 passwd)



# Learning Objectives

At the end of this project, you are expected to be able to explain to anyone, without the help of Google:



# Shell, I/O Redirection



* What do the commands head, tail, find, wc, sort, uniq, grep, tr do

* How to get standard input from a file instead of the keyboard

* How to send the output from one program to the input of another program

* How to combine commands and filters with redirections



# Special Characters

* What are special characters

* Understand what do the white spaces, single quotes, double quotes, backslash, comment, pipe, command separator, tilde and how and when to use them



# Other Man Pages

* How to display a line of text

* How to concatenate files and print on the standard output

* How to reverse a string

* How to remove sections from each line of files

* What is the /etc/passwd file and what is its format

* What is the /etc/shadow file and what is its format

# More Info

* Read your /etc/passwd and /etc/shadow files.

* Note: learn about fmt, pr, du, gzip, tar, lpr, sed and awk.

# How to Run Two or More Terminal Commands at Once in Linux

# Option One: The Semicolon (;) Operator
* ls ; pwd ; whoami


# Option Two: The Logical AND Operator (&&)
* mkdir MyFolder && cd MyFolder

# Option Three: The Logical OR Operator (||)
* [ -d ~/MyFolder ] || mkdir ~/MyFolder

# Combining Multiple Operators
* [ -f ~/sample.txt ] && echo "File exists." || touch ~/sample.txt

# Summary
 * A ; B  — Run A and then B, regardless of the success or failure of A
 * A && B  — Run B only if A succeeded
 * A || B  — Run B only if A failed


# 3 WAYS TO GET THE NTH LINE OF A FILE IN LINUX

The need to get/print a particular line of a file on the Linux shell is a common task. Luckily there are various ways to do this. Below are three great ways to get the nth line of a file in Linux.

# Head / Tail

Simply using the combination of the head and tail commands is probably the easiest approach. Below is an example using head and tail to read the 25th line of sample_data_1.txt:
* cat sample_data_1.txt | head -25 | tail -1

# Sed
There are a couple of nice ways to do this with sed. The first is with the p (print) command, and the other is with the d (delete) command. The n option with the print command is used to only print lines explicitly indicated by the command. For example, sed will output the 25th line of sample_data_1.txt with each of the commands below:

#print/p command

* cat sample_data_1.txt | sed -n '25p'

#delete/d command

* cat sample_data_1.txt | sed '25!d'

# awk
awk has a built in variable NR that keeps track of file/stream row numbers. awk syntax and idioms can be hard to read, so below are three different ways to print line 25 of sample_data_1.txt file using awk.

* awk example 1

cat sample_data_1.txt | awk 'NR==25'

*awk example 2

cat sample_data_1.txt | awk 'NR==25{print}'

*awk example 3

cat sample_data_1.txt | awk '{if(NR==25) print}'

# Take the last line of the top three lines 
 * head -n 3 my.txt | tail -n 1 
 
# Tell sed to "be quiet", and print just the third line 
 * sed -n 3p my.txt 
 
# Tell sed to delete everything except the third line 
 * sed '3!d' my.txt 
 
# Tell awk to print the third input record of the current file 
 * awk 'FNR==3 {print}' my.txt

<h3 align="left">Connect with me:</h3>

<p align="left">

<a href="https://twitter.com/node_finder" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/twitter.svg" alt="node_finder" height="30" width="40" /></a>

<a href="https://linkedin.com/in/https://www.linkedin.com/in/kenewenemor-ekrika/" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="https://www.linkedin.com/in/kenewenemor-ekrika/" height="30" width="40" /></a>

<a href="https://stackoverflow.com/users/ekrikakenny@gmail.com" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/stack-overflow.svg" alt="ekrikakenny@gmail.com" height="30" width="40" /></a>

</p>








