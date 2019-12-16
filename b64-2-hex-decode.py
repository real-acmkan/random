'''
author: real-acmkan (c) 2019
note: this can only handle padded input and assumes the input is utf-8 encoded
'''

import base64

def main():
  dec = raw_input()
  hex = base64.decode(dec)
  bytes.fromhex(hex).decode('utf-8')

main()
