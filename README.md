[![Actions Status](https://github.com/plainbanana/Redis-Cluster-Fast/workflows/test/badge.svg)](https://github.com/plainbanana/Redis-Cluster-Fast/actions) [![MetaCPAN Release](https://badge.fury.io/pl/Redis-Cluster-Fast.svg)](https://metacpan.org/release/Redis-Cluster-Fast)
# NAME

Redis::Cluster::Fast - A fast perl binding for Redis Cluster

# SYNOPSIS

    use Redis::Cluster::Fast;

    my $redis = Redis::Cluster::Fast->new(
        startup_nodes => [
            'localhost:9000',
            'localhost:9001',
            'localhost:9002',
            'localhost:9003',
            'localhost:9004',
            'localhost:9005',
        ],
        connect_timeout => 0.05,
        command_timeout => 0.05,
        max_retry_count => 10,
    );

    $redis->set('test', 123);

    # '123'
    my $str = $redis->get('test');

    $redis->mset('{my}foo', 'hoge', '{my}bar', 'fuga');

    # get as array-ref
    my $array_ref = $redis->mget('{my}foo', '{my}bar');
    # get as array
    my @array = $redis->mget('{my}foo', '{my}bar');

    $redis->hset('mymap', 'field1', 'Hello');
    $redis->hset('mymap', 'field2', 'ByeBye');

    # get as hash-ref
    my $hash_ref = $redis->hgetall('mymap');
    # get as hash
    my %hash = $redis->hgetall('mymap');

# DESCRIPTION

Redis::Cluster::Fast is like [Redis::Fast](https://github.com/shogo82148/Redis-Fast) but support Redis Cluster by [hiredis-cluster](https://github.com/Nordix/hiredis-cluster).

Require Redis 6 or higher to support [RESP3](https://github.com/antirez/RESP3/blob/master/spec.md).

To build this module you need at least autoconf, automake, libtool, patch, pkg-config are installed on your system.

## MICROBENCHMARK

Simple microbenchmark comparing PP and XS.
The benchmark script used can be found under examples directory.

    Redis::Cluster::Fast is 0.084
    Redis::ClusterRider is 0.26
    ### mset ###
                            Rate  Redis::ClusterRider Redis::Cluster::Fast
    Redis::ClusterRider  13245/s                   --                 -34%
    Redis::Cluster::Fast 20080/s                  52%                   --
    ### mget ###
                            Rate  Redis::ClusterRider Redis::Cluster::Fast
    Redis::ClusterRider  14641/s                   --                 -40%
    Redis::Cluster::Fast 24510/s                  67%                   --
    ### incr ###
                            Rate  Redis::ClusterRider Redis::Cluster::Fast
    Redis::ClusterRider  18367/s                   --                 -44%
    Redis::Cluster::Fast 32879/s                  79%                   --
    ### new and ping ###
                           Rate  Redis::ClusterRider Redis::Cluster::Fast
    Redis::ClusterRider   146/s                   --                 -96%
    Redis::Cluster::Fast 3941/s                2598%                   --

# METHODS

## new(%args)

Following arguments are available.

- startup\_nodes

    Specifies the list of Redis Cluster nodes.

- connect\_timeout

    A fractional seconds. (default: 10)

    Connection timeout to connect to a Redis node.

- command\_timeout

    A fractional seconds. (default: 10)

    Redis Command execution timeout.

- max\_retry\_count

    A integer value. (default: 10)

## &lt;command>(@args)

To run Redis command with arguments.

# LICENSE

Copyright (C) plainbanana.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

plainbanana <plainbanana@mustardon.tokyo>

# SEE ALSO

- [Redis::ClusterRider](https://github.com/iph0/Redis-ClusterRider)
- [Redis::Fast](https://github.com/shogo82148/Redis-Fast)
