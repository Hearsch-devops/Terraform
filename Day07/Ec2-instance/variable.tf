variable "instance" {

     type = map(string)
     
     default =  {
        web1 = "t3.micro"
        web2 = "t3.micro"
        web3 = "t3.micro"
    }
  
}