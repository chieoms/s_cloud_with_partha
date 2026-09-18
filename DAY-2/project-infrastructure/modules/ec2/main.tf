

# WEB SERVER
# -------------------------------------------------------------------------------------
resource "aws_instance" "web_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.web_server_key.key_name
  vpc_security_group_ids = var.web_server_sg_ids
  subnet_id              = var.public_subnet_id
  iam_instance_profile   = aws_iam_instance_profile.ssm_ec2_profile.name
  user_data              = var.web_server_user_data
  associate_public_ip_address = true

  root_block_device {
    volume_size = 8
    volume_type = "gp3"

    delete_on_termination = true

    tags = merge(var.tags, {
      Name = "${var.web_server_name}-volume"
    })
  }

  tags = merge(var.tags, {
    Name = var.web_server_name
  })

}

resource "aws_key_pair" "web_server_key" {
  key_name   = var.web_server_key_name
  public_key = var.web_server_public_key_name
}




# APP SERVER
# -------------------------------------------------------------------------------------
resource "aws_instance" "app_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.app_server_key.key_name
  vpc_security_group_ids = var.app_server_sg_ids
  subnet_id              = var.private_subnet_id
  iam_instance_profile   = aws_iam_instance_profile.ssm_ec2_profile.name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"

    delete_on_termination = true

    tags = merge(var.tags, {
      Name = "${var.app_server_name}-volume"
    })
  }

  tags = merge(var.tags, {
    Name = var.app_server_name
  })

}

resource "aws_key_pair" "app_server_key" {
  key_name   = var.app_server_key_name
  public_key = var.app_server_public_key_name
}



# IAM ROLE FOR SSM
resource "aws_iam_role" "ssm_lab_instance_role" {
  name = var.ssm_lab_instance_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge({ Name = var.ssm_lab_instance_role_name }, var.tags)
}

resource "aws_iam_role_policy_attachment" "ssm_ec2_policy" {
  role       = aws_iam_role.ssm_lab_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_ec2_profile" {
  name = "ec2-ssm-profile"
  role = aws_iam_role.ssm_lab_instance_role.name
}