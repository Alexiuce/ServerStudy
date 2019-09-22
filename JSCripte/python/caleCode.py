# coding=UTF-8
import os,sys
def linesOfFile(filepath):
        lines = 0
        with open(filepath) as f:
                for line in f:
                        if line.strip() != "": #忽略空白行
                                #print "line: " + line.strip()
                                lines = lines + 1
        return lines
def walkJava(path):
        count = 0
        lines = 0
        for root, subFolder, files in os.walk(path):
                for file in files:
                        if file.endswith(".m"):
                                count=count + 1
                                lines = lines + linesOfFile(os.path.join(root, file))
        print "Total Java File Number: " + str(count)
        print "Tocal Lines of Java Source: " + str(lines)
if "__main__" == __name__:
        walkJava(sys.argv[1])