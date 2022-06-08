resource "aws_elasticache_cluster" "redis-slave-r" {
  cluster_id           = "redis-rinad"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name = aws_elasticache_subnet_group.subnet-elasticache-group.name
  security_group_ids = [aws_security_group.security-group-database.id]
}
resource "aws_elasticache_subnet_group" "subnet-elasticache-group" {
  name       = "subnet-elasticache-group"
  subnet_ids = [module.MainNetwork.pri-sub-1-id  , module.MainNetwork.pri-sub-2-id ]

  tags = {
    Name = "My elasticache subnet group"
  }
}
