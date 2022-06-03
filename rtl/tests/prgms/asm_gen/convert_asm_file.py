#!/usr/bin/python3

import sys, getopt
import parse_asm


def main(argv):
   # ==========================================================================
   # parse arguments
   inputfile = ''
   outputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
   except getopt.GetoptError:
      print('Usage: convert_asm_file.py -i <inputfile> -o <outputfile>')
      sys.exit(1)
   for opt, arg in opts:
      if opt == '-h':
         print('Usage: convert_asm_file.py -i <inputfile> -o <outputfile>')
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputfile = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
   
   # ==========================================================================
   # Convert instructions in input file
   instr_file = open(inputfile, 'r')
   instr_file_txt = instr_file.readlines()

   bin_out_file = open(outputfile, "w")

   line_num = 1
   for line in instr_file_txt:
      try:
         if ((line.replace(' ','')[0:2] == '//') or (len(line) == 0) or (line == '\n')):
            line_num += 1
            continue
         bin_string = str(parse_asm.get_instr_encoding(line))
         print(bin_string + " // " + line)
         
         bin_out_file.write(bin_string[24:32] + '\n')
         bin_out_file.write(bin_string[16:24] + '\n')
         bin_out_file.write(bin_string[8:16]  + '\n')
         bin_out_file.write(bin_string[0:8]   + '\n')

         # bin_out_file.write(parse_asm.get_instr_encoding(line)  + '\n')
      except ValueError as e:
         print(e.args[0])
         print("Issue on line: ", line_num)
         instr_file.close()
         bin_out_file.close()
         sys.exit(1)
      line_num += 1
         
   instr_file.close()
   bin_out_file.close()


if __name__ == "__main__":
   main(sys.argv[1:])
