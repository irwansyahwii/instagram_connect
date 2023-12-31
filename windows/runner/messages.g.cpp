// Autogenerated from Pigeon (v13.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#undef _HAS_EXCEPTIONS

#include "messages.g.h"

#include <flutter/basic_message_channel.h>
#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/standard_message_codec.h>

#include <map>
#include <optional>
#include <string>

namespace pigeon_example {
using flutter::BasicMessageChannel;
using flutter::CustomEncodableValue;
using flutter::EncodableList;
using flutter::EncodableMap;
using flutter::EncodableValue;

// MessageData

MessageData::MessageData(
  const Code& code,
  const EncodableMap& data)
 : code_(code),
    data_(data) {}

MessageData::MessageData(
  const std::string* name,
  const std::string* description,
  const Code& code,
  const EncodableMap& data)
 : name_(name ? std::optional<std::string>(*name) : std::nullopt),
    description_(description ? std::optional<std::string>(*description) : std::nullopt),
    code_(code),
    data_(data) {}

const std::string* MessageData::name() const {
  return name_ ? &(*name_) : nullptr;
}

void MessageData::set_name(const std::string_view* value_arg) {
  name_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void MessageData::set_name(std::string_view value_arg) {
  name_ = value_arg;
}


const std::string* MessageData::description() const {
  return description_ ? &(*description_) : nullptr;
}

void MessageData::set_description(const std::string_view* value_arg) {
  description_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void MessageData::set_description(std::string_view value_arg) {
  description_ = value_arg;
}


const Code& MessageData::code() const {
  return code_;
}

void MessageData::set_code(const Code& value_arg) {
  code_ = value_arg;
}


const EncodableMap& MessageData::data() const {
  return data_;
}

void MessageData::set_data(const EncodableMap& value_arg) {
  data_ = value_arg;
}


EncodableList MessageData::ToEncodableList() const {
  EncodableList list;
  list.reserve(4);
  list.push_back(name_ ? EncodableValue(*name_) : EncodableValue());
  list.push_back(description_ ? EncodableValue(*description_) : EncodableValue());
  list.push_back(EncodableValue((int)code_));
  list.push_back(EncodableValue(data_));
  return list;
}

MessageData MessageData::FromEncodableList(const EncodableList& list) {
  MessageData decoded(
    (Code)(std::get<int32_t>(list[2])),
    std::get<EncodableMap>(list[3]));
  auto& encodable_name = list[0];
  if (!encodable_name.IsNull()) {
    decoded.set_name(std::get<std::string>(encodable_name));
  }
  auto& encodable_description = list[1];
  if (!encodable_description.IsNull()) {
    decoded.set_description(std::get<std::string>(encodable_description));
  }
  return decoded;
}

// Permission

Permission::Permission(const std::string& name)
 : name_(name) {}

const std::string& Permission::name() const {
  return name_;
}

void Permission::set_name(std::string_view value_arg) {
  name_ = value_arg;
}


EncodableList Permission::ToEncodableList() const {
  EncodableList list;
  list.reserve(1);
  list.push_back(EncodableValue(name_));
  return list;
}

Permission Permission::FromEncodableList(const EncodableList& list) {
  Permission decoded(
    std::get<std::string>(list[0]));
  return decoded;
}

// TikTokLoginResult

TikTokLoginResult::TikTokLoginResult(
  const TikTokLoginStatus& status,
  const EncodableList& granted_permissions,
  const std::string& scope_name)
 : status_(status),
    granted_permissions_(granted_permissions),
    scope_name_(scope_name) {}

TikTokLoginResult::TikTokLoginResult(
  const TikTokLoginStatus& status,
  const std::string* auth_code,
  const std::string* state,
  const std::string* code_verifier,
  const EncodableList& granted_permissions,
  const std::string* error_code,
  const std::string* error_message,
  const std::string& scope_name)
 : status_(status),
    auth_code_(auth_code ? std::optional<std::string>(*auth_code) : std::nullopt),
    state_(state ? std::optional<std::string>(*state) : std::nullopt),
    code_verifier_(code_verifier ? std::optional<std::string>(*code_verifier) : std::nullopt),
    granted_permissions_(granted_permissions),
    error_code_(error_code ? std::optional<std::string>(*error_code) : std::nullopt),
    error_message_(error_message ? std::optional<std::string>(*error_message) : std::nullopt),
    scope_name_(scope_name) {}

const TikTokLoginStatus& TikTokLoginResult::status() const {
  return status_;
}

void TikTokLoginResult::set_status(const TikTokLoginStatus& value_arg) {
  status_ = value_arg;
}


const std::string* TikTokLoginResult::auth_code() const {
  return auth_code_ ? &(*auth_code_) : nullptr;
}

void TikTokLoginResult::set_auth_code(const std::string_view* value_arg) {
  auth_code_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void TikTokLoginResult::set_auth_code(std::string_view value_arg) {
  auth_code_ = value_arg;
}


const std::string* TikTokLoginResult::state() const {
  return state_ ? &(*state_) : nullptr;
}

void TikTokLoginResult::set_state(const std::string_view* value_arg) {
  state_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void TikTokLoginResult::set_state(std::string_view value_arg) {
  state_ = value_arg;
}


const std::string* TikTokLoginResult::code_verifier() const {
  return code_verifier_ ? &(*code_verifier_) : nullptr;
}

void TikTokLoginResult::set_code_verifier(const std::string_view* value_arg) {
  code_verifier_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void TikTokLoginResult::set_code_verifier(std::string_view value_arg) {
  code_verifier_ = value_arg;
}


const EncodableList& TikTokLoginResult::granted_permissions() const {
  return granted_permissions_;
}

void TikTokLoginResult::set_granted_permissions(const EncodableList& value_arg) {
  granted_permissions_ = value_arg;
}


const std::string* TikTokLoginResult::error_code() const {
  return error_code_ ? &(*error_code_) : nullptr;
}

void TikTokLoginResult::set_error_code(const std::string_view* value_arg) {
  error_code_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void TikTokLoginResult::set_error_code(std::string_view value_arg) {
  error_code_ = value_arg;
}


const std::string* TikTokLoginResult::error_message() const {
  return error_message_ ? &(*error_message_) : nullptr;
}

void TikTokLoginResult::set_error_message(const std::string_view* value_arg) {
  error_message_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void TikTokLoginResult::set_error_message(std::string_view value_arg) {
  error_message_ = value_arg;
}


const std::string& TikTokLoginResult::scope_name() const {
  return scope_name_;
}

void TikTokLoginResult::set_scope_name(std::string_view value_arg) {
  scope_name_ = value_arg;
}


EncodableList TikTokLoginResult::ToEncodableList() const {
  EncodableList list;
  list.reserve(8);
  list.push_back(EncodableValue((int)status_));
  list.push_back(auth_code_ ? EncodableValue(*auth_code_) : EncodableValue());
  list.push_back(state_ ? EncodableValue(*state_) : EncodableValue());
  list.push_back(code_verifier_ ? EncodableValue(*code_verifier_) : EncodableValue());
  list.push_back(EncodableValue(granted_permissions_));
  list.push_back(error_code_ ? EncodableValue(*error_code_) : EncodableValue());
  list.push_back(error_message_ ? EncodableValue(*error_message_) : EncodableValue());
  list.push_back(EncodableValue(scope_name_));
  return list;
}

TikTokLoginResult TikTokLoginResult::FromEncodableList(const EncodableList& list) {
  TikTokLoginResult decoded(
    (TikTokLoginStatus)(std::get<int32_t>(list[0])),
    std::get<EncodableList>(list[4]),
    std::get<std::string>(list[7]));
  auto& encodable_auth_code = list[1];
  if (!encodable_auth_code.IsNull()) {
    decoded.set_auth_code(std::get<std::string>(encodable_auth_code));
  }
  auto& encodable_state = list[2];
  if (!encodable_state.IsNull()) {
    decoded.set_state(std::get<std::string>(encodable_state));
  }
  auto& encodable_code_verifier = list[3];
  if (!encodable_code_verifier.IsNull()) {
    decoded.set_code_verifier(std::get<std::string>(encodable_code_verifier));
  }
  auto& encodable_error_code = list[5];
  if (!encodable_error_code.IsNull()) {
    decoded.set_error_code(std::get<std::string>(encodable_error_code));
  }
  auto& encodable_error_message = list[6];
  if (!encodable_error_message.IsNull()) {
    decoded.set_error_message(std::get<std::string>(encodable_error_message));
  }
  return decoded;
}


ExampleHostApiCodecSerializer::ExampleHostApiCodecSerializer() {}

EncodableValue ExampleHostApiCodecSerializer::ReadValueOfType(
  uint8_t type,
  flutter::ByteStreamReader* stream) const {
  switch (type) {
    case 128:
      return CustomEncodableValue(MessageData::FromEncodableList(std::get<EncodableList>(ReadValue(stream))));
    default:
      return flutter::StandardCodecSerializer::ReadValueOfType(type, stream);
  }
}

void ExampleHostApiCodecSerializer::WriteValue(
  const EncodableValue& value,
  flutter::ByteStreamWriter* stream) const {
  if (const CustomEncodableValue* custom_value = std::get_if<CustomEncodableValue>(&value)) {
    if (custom_value->type() == typeid(MessageData)) {
      stream->WriteByte(128);
      WriteValue(EncodableValue(std::any_cast<MessageData>(*custom_value).ToEncodableList()), stream);
      return;
    }
  }
  flutter::StandardCodecSerializer::WriteValue(value, stream);
}

/// The codec used by ExampleHostApi.
const flutter::StandardMessageCodec& ExampleHostApi::GetCodec() {
  return flutter::StandardMessageCodec::GetInstance(&ExampleHostApiCodecSerializer::GetInstance());
}

// Sets up an instance of `ExampleHostApi` to handle messages through the `binary_messenger`.
void ExampleHostApi::SetUp(
  flutter::BinaryMessenger* binary_messenger,
  ExampleHostApi* api) {
  {
    auto channel = std::make_unique<BasicMessageChannel<>>(binary_messenger, "dev.flutter.pigeon.instagram_connect.ExampleHostApi.getHostLanguage", &GetCodec());
    if (api != nullptr) {
      channel->SetMessageHandler([api](const EncodableValue& message, const flutter::MessageReply<EncodableValue>& reply) {
        try {
          ErrorOr<std::string> output = api->GetHostLanguage();
          if (output.has_error()) {
            reply(WrapError(output.error()));
            return;
          }
          EncodableList wrapped;
          wrapped.push_back(EncodableValue(std::move(output).TakeValue()));
          reply(EncodableValue(std::move(wrapped)));
        } catch (const std::exception& exception) {
          reply(WrapError(exception.what()));
        }
      });
    } else {
      channel->SetMessageHandler(nullptr);
    }
  }
  {
    auto channel = std::make_unique<BasicMessageChannel<>>(binary_messenger, "dev.flutter.pigeon.instagram_connect.ExampleHostApi.add", &GetCodec());
    if (api != nullptr) {
      channel->SetMessageHandler([api](const EncodableValue& message, const flutter::MessageReply<EncodableValue>& reply) {
        try {
          const auto& args = std::get<EncodableList>(message);
          const auto& encodable_a_arg = args.at(0);
          if (encodable_a_arg.IsNull()) {
            reply(WrapError("a_arg unexpectedly null."));
            return;
          }
          const int64_t a_arg = encodable_a_arg.LongValue();
          const auto& encodable_b_arg = args.at(1);
          if (encodable_b_arg.IsNull()) {
            reply(WrapError("b_arg unexpectedly null."));
            return;
          }
          const int64_t b_arg = encodable_b_arg.LongValue();
          ErrorOr<int64_t> output = api->Add(a_arg, b_arg);
          if (output.has_error()) {
            reply(WrapError(output.error()));
            return;
          }
          EncodableList wrapped;
          wrapped.push_back(EncodableValue(std::move(output).TakeValue()));
          reply(EncodableValue(std::move(wrapped)));
        } catch (const std::exception& exception) {
          reply(WrapError(exception.what()));
        }
      });
    } else {
      channel->SetMessageHandler(nullptr);
    }
  }
  {
    auto channel = std::make_unique<BasicMessageChannel<>>(binary_messenger, "dev.flutter.pigeon.instagram_connect.ExampleHostApi.sendMessage", &GetCodec());
    if (api != nullptr) {
      channel->SetMessageHandler([api](const EncodableValue& message, const flutter::MessageReply<EncodableValue>& reply) {
        try {
          const auto& args = std::get<EncodableList>(message);
          const auto& encodable_message_arg = args.at(0);
          if (encodable_message_arg.IsNull()) {
            reply(WrapError("message_arg unexpectedly null."));
            return;
          }
          const auto& message_arg = std::any_cast<const MessageData&>(std::get<CustomEncodableValue>(encodable_message_arg));
          api->SendMessage(message_arg, [reply](ErrorOr<bool>&& output) {
            if (output.has_error()) {
              reply(WrapError(output.error()));
              return;
            }
            EncodableList wrapped;
            wrapped.push_back(EncodableValue(std::move(output).TakeValue()));
            reply(EncodableValue(std::move(wrapped)));
          });
        } catch (const std::exception& exception) {
          reply(WrapError(exception.what()));
        }
      });
    } else {
      channel->SetMessageHandler(nullptr);
    }
  }
}

EncodableValue ExampleHostApi::WrapError(std::string_view error_message) {
  return EncodableValue(EncodableList{
    EncodableValue(std::string(error_message)),
    EncodableValue("Error"),
    EncodableValue()
  });
}

EncodableValue ExampleHostApi::WrapError(const FlutterError& error) {
  return EncodableValue(EncodableList{
    EncodableValue(error.code()),
    EncodableValue(error.message()),
    error.details()
  });
}


TiktokSDKApiCodecSerializer::TiktokSDKApiCodecSerializer() {}

EncodableValue TiktokSDKApiCodecSerializer::ReadValueOfType(
  uint8_t type,
  flutter::ByteStreamReader* stream) const {
  switch (type) {
    case 128:
      return CustomEncodableValue(Permission::FromEncodableList(std::get<EncodableList>(ReadValue(stream))));
    case 129:
      return CustomEncodableValue(TikTokLoginResult::FromEncodableList(std::get<EncodableList>(ReadValue(stream))));
    default:
      return flutter::StandardCodecSerializer::ReadValueOfType(type, stream);
  }
}

void TiktokSDKApiCodecSerializer::WriteValue(
  const EncodableValue& value,
  flutter::ByteStreamWriter* stream) const {
  if (const CustomEncodableValue* custom_value = std::get_if<CustomEncodableValue>(&value)) {
    if (custom_value->type() == typeid(Permission)) {
      stream->WriteByte(128);
      WriteValue(EncodableValue(std::any_cast<Permission>(*custom_value).ToEncodableList()), stream);
      return;
    }
    if (custom_value->type() == typeid(TikTokLoginResult)) {
      stream->WriteByte(129);
      WriteValue(EncodableValue(std::any_cast<TikTokLoginResult>(*custom_value).ToEncodableList()), stream);
      return;
    }
  }
  flutter::StandardCodecSerializer::WriteValue(value, stream);
}

/// The codec used by TiktokSDKApi.
const flutter::StandardMessageCodec& TiktokSDKApi::GetCodec() {
  return flutter::StandardMessageCodec::GetInstance(&TiktokSDKApiCodecSerializer::GetInstance());
}

// Sets up an instance of `TiktokSDKApi` to handle messages through the `binary_messenger`.
void TiktokSDKApi::SetUp(
  flutter::BinaryMessenger* binary_messenger,
  TiktokSDKApi* api) {
  {
    auto channel = std::make_unique<BasicMessageChannel<>>(binary_messenger, "dev.flutter.pigeon.instagram_connect.TiktokSDKApi.setup", &GetCodec());
    if (api != nullptr) {
      channel->SetMessageHandler([api](const EncodableValue& message, const flutter::MessageReply<EncodableValue>& reply) {
        try {
          const auto& args = std::get<EncodableList>(message);
          const auto& encodable_client_key_arg = args.at(0);
          if (encodable_client_key_arg.IsNull()) {
            reply(WrapError("client_key_arg unexpectedly null."));
            return;
          }
          const auto& client_key_arg = std::get<std::string>(encodable_client_key_arg);
          api->Setup(client_key_arg, [reply](std::optional<FlutterError>&& output) {
            if (output.has_value()) {
              reply(WrapError(output.value()));
              return;
            }
            EncodableList wrapped;
            wrapped.push_back(EncodableValue());
            reply(EncodableValue(std::move(wrapped)));
          });
        } catch (const std::exception& exception) {
          reply(WrapError(exception.what()));
        }
      });
    } else {
      channel->SetMessageHandler(nullptr);
    }
  }
  {
    auto channel = std::make_unique<BasicMessageChannel<>>(binary_messenger, "dev.flutter.pigeon.instagram_connect.TiktokSDKApi.login", &GetCodec());
    if (api != nullptr) {
      channel->SetMessageHandler([api](const EncodableValue& message, const flutter::MessageReply<EncodableValue>& reply) {
        try {
          const auto& args = std::get<EncodableList>(message);
          const auto& encodable_permissions_arg = args.at(0);
          if (encodable_permissions_arg.IsNull()) {
            reply(WrapError("permissions_arg unexpectedly null."));
            return;
          }
          const auto& permissions_arg = std::get<EncodableList>(encodable_permissions_arg);
          const auto& encodable_redirect_uri_arg = args.at(1);
          if (encodable_redirect_uri_arg.IsNull()) {
            reply(WrapError("redirect_uri_arg unexpectedly null."));
            return;
          }
          const auto& redirect_uri_arg = std::get<std::string>(encodable_redirect_uri_arg);
          const auto& encodable_browser_auth_enabled_arg = args.at(2);
          const auto* browser_auth_enabled_arg = std::get_if<bool>(&encodable_browser_auth_enabled_arg);
          api->Login(permissions_arg, redirect_uri_arg, browser_auth_enabled_arg, [reply](ErrorOr<TikTokLoginResult>&& output) {
            if (output.has_error()) {
              reply(WrapError(output.error()));
              return;
            }
            EncodableList wrapped;
            wrapped.push_back(CustomEncodableValue(std::move(output).TakeValue()));
            reply(EncodableValue(std::move(wrapped)));
          });
        } catch (const std::exception& exception) {
          reply(WrapError(exception.what()));
        }
      });
    } else {
      channel->SetMessageHandler(nullptr);
    }
  }
}

EncodableValue TiktokSDKApi::WrapError(std::string_view error_message) {
  return EncodableValue(EncodableList{
    EncodableValue(std::string(error_message)),
    EncodableValue("Error"),
    EncodableValue()
  });
}

EncodableValue TiktokSDKApi::WrapError(const FlutterError& error) {
  return EncodableValue(EncodableList{
    EncodableValue(error.code()),
    EncodableValue(error.message()),
    error.details()
  });
}

}  // namespace pigeon_example
