# Directory where .proto files are located
PROTO_DIR = proto

# Output directory for generated Go files
OUT_DIR = gen/go

# Define the command to run protoc
PROTOC_GEN = protoc -I $(PROTO_DIR) $(PROTO_DIR)/sso/sso.proto \
  --go_out=$(OUT_DIR) --go_opt=paths=source_relative \
  --go-grpc_out=$(OUT_DIR) --go-grpc_opt=paths=source_relative

# Ensure output directory exists before generating Protobuf files
proto-generate: $(OUT_DIR)
	$(PROTOC_GEN)

# Ensure output directory existss
$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

# Default target
all: proto-generate

.PHONY: all clean proto-generate

# Clean generated files
clean:
	rm -rf $(OUT_DIR)