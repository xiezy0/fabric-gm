module github.com/hyperledger/fabric

go 1.14

require (
	code.cloudfoundry.org/clock v1.0.0
	github.com/Hyperledger-TWGC/tjfoc-gm v0.0.0-20210222084201-e65875425ad3
	github.com/Knetic/govaluate v3.0.0+incompatible
	github.com/Shopify/sarama v1.26.1
	github.com/VividCortex/gohistogram v1.0.0 // indirect
	github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc // indirect
	github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf // indirect
	github.com/containerd/continuity v0.0.0-20181003075958-be9bd761db19 // indirect
	github.com/coreos/pkg v0.0.0-20180108230652-97fdf19511ea // indirect
	github.com/davecgh/go-spew v1.1.1
	github.com/docker/docker v1.4.2-0.20180827131323-0c5f8d2b9b23 // indirect
	github.com/fatih/color v1.9.0 // indirect
	github.com/frankban/quicktest v1.9.0 // indirect
	github.com/fsouza/go-dockerclient v1.3.0
	github.com/go-kit/kit v0.7.0
	github.com/go-logfmt/logfmt v0.3.0 // indirect
	github.com/go-stack/stack v1.8.0 // indirect
	github.com/gogo/protobuf v1.1.1
	github.com/golang/protobuf v1.4.2
	github.com/gorilla/handlers v1.4.0
	github.com/gorilla/mux v1.6.2
	github.com/grpc-ecosystem/go-grpc-middleware v1.0.0
	github.com/hashicorp/go-version v1.0.0
	github.com/hyperledger/fabric-amcl v0.0.0-20180903120555-6b78f7a22d95
	github.com/hyperledger/fabric-lib-go v1.0.0
	github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515 // indirect
	github.com/kr/pretty v0.2.0
	github.com/magiconair/properties v1.8.0 // indirect
	github.com/mattn/go-colorable v0.1.6 // indirect
	github.com/mattn/go-runewidth v0.0.3 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.1 // indirect
	github.com/miekg/pkcs11 v0.0.0-20181002074154-c6d6ee821fb1
	github.com/mitchellh/mapstructure v1.1.1
	github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e // indirect
	github.com/onsi/ginkgo v1.12.1
	github.com/onsi/gomega v1.10.3
	github.com/op/go-logging v0.0.0-20160315200505-970db520ece7
	github.com/pierrec/lz4 v2.5.1+incompatible // indirect
	github.com/pkg/errors v0.8.1
	github.com/prometheus/client_golang v0.9.0
	github.com/prometheus/common v0.0.0-20181019103554-16b4535ad14a // indirect
	github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d // indirect
	github.com/rcrowley/go-metrics v0.0.0-20200313005456-10cdbea86bc0
	github.com/spf13/cast v1.2.0 // indirect
	github.com/spf13/cobra v0.0.3
	github.com/spf13/jwalterweatherman v1.0.0 // indirect
	github.com/spf13/pflag v1.0.3
	github.com/spf13/viper v0.0.0-20150908122457-1967d93db724
	github.com/stretchr/objx v0.1.1 // indirect
	github.com/stretchr/testify v1.6.1
	github.com/sykesm/zap-logfmt v0.0.3
	github.com/syndtr/goleveldb v0.0.0-20180815032940-ae2bd5eed72d
	github.com/tedsuo/ifrit v0.0.0-20180802180643-bea94bb476cc
	github.com/tw-bc-group/aliyun-kms v0.0.0-20201126132256-b9c99bba772d
	github.com/willf/bitset v1.1.9
	go.etcd.io/etcd v0.5.0-alpha.5.0.20181228115726-23731bf9ba55
	go.uber.org/zap v1.12.0
	golang.org/x/crypto v0.0.0-20201012173705-84dcc777aaee
	golang.org/x/net v0.0.0-20201026091529-146b70c837a4
	golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9
	golang.org/x/tools v0.0.0-20201023174141-c8cfbd0f21e6
	google.golang.org/grpc v1.31.0
	gopkg.in/alecthomas/kingpin.v2 v2.2.6
	gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b // indirect
	gopkg.in/cheggaaa/pb.v1 v1.0.25
	gopkg.in/yaml.v2 v2.3.0
)

replace (
	github.com/gogo/protobuf => github.com/gogo/protobuf v1.0.0
	github.com/golang/protobuf => github.com/golang/protobuf v1.3.3
)
