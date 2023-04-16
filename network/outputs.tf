output vpc_id{
    value =  aws_vpc.myvpc.id
}

output public1_subnet_id{
    value =  aws_subnet.public-subnet-1.id
}
output public2_subnet_id{
    value =  aws_subnet.public-subnet-2.id
}

output cidr {

    value       = aws_vpc.myvpc.cidr_block
}