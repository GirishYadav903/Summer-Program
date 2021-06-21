provider "aws" {
	region = "ap-south-1"
	profile = "default"
}

resource "aws_instance" "webos1" {
  ami               = "ami-0ad704c126371a549"
  availability_zone = "ap-south-1b"
  instance_type     = "t2.micro"

  tags = {
    Name = "Face_Instance"
  }
}

resource "aws_ebs_volume" "ebs1" {
  availability_zone = "ap-south-1b"
  size              = 5

  tags = {
    Name = "Face_Volume"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs1.id
  instance_id = aws_instance.webos1.id
}