// Autogenerated from Pigeon (v13.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression", "serial"})
public class Messages {

  /** Error class for passing custom error details to Flutter via a thrown PlatformException. */
  public static class FlutterError extends RuntimeException {

    /** The error code. */
    public final String code;

    /** The error details. Must be a datatype supported by the api codec. */
    public final Object details;

    public FlutterError(@NonNull String code, @Nullable String message, @Nullable Object details) 
    {
      super(message);
      this.code = code;
      this.details = details;
    }
  }

  @NonNull
  protected static ArrayList<Object> wrapError(@NonNull Throwable exception) {
    ArrayList<Object> errorList = new ArrayList<Object>(3);
    if (exception instanceof FlutterError) {
      FlutterError error = (FlutterError) exception;
      errorList.add(error.code);
      errorList.add(error.getMessage());
      errorList.add(error.details);
    } else {
      errorList.add(exception.toString());
      errorList.add(exception.getClass().getSimpleName());
      errorList.add(
        "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    }
    return errorList;
  }

  public enum Code {
    ONE(0),
    TWO(1);

    final int index;

    private Code(final int index) {
      this.index = index;
    }
  }

  public enum TikTokLoginStatus {
    SUCCESS(0),
    CANCELLED(1),
    ERROR(2);

    final int index;

    private TikTokLoginStatus(final int index) {
      this.index = index;
    }
  }

  /** https://developers.tiktok.com/doc/tiktok-api-scopes/ */
  public enum TikTokPermissionType {
    /** Access to public commercial data for research purposes */
    RESEARCH_ADLIB_BASIC(0),
    /** Access to TikTok public data for research purposes */
    RESEARCH_DATA_BASIC(1),
    /** Read a user's profile info (open id, avatar, display name ...) */
    USER_INFO_BASIC(2),
    /** Read access to profile_web_link, profile_deep_link, bio_description, is_verified. */
    USER_INFO_PROFILE(3),
    /** Read access to a user's statistical data, such as likes count, follower count, following count, and video count */
    USER_INFO_STATS(4),
    /** Read the user's in app communication settings (currently only DM settings are supported) */
    USER_SETTING_LIST(5),
    /** Update the user's in app communication settings (currently only DM settings are supported) */
    USER_SETTINGS_UPDATE(6),
    /** Read a user's public videos on TikTok */
    VIDEO_LIST(7),
    /** Directly post videos to a user's TikTok profile. */
    VIDEO_PUBLISH(8),
    /** Share videos to the creator's account as a draft to further edit and post in TikTok. */
    VIDEO_UPLOAD(9);

    final int index;

    private TikTokPermissionType(final int index) {
      this.index = index;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class MessageData {
    private @Nullable String name;

    public @Nullable String getName() {
      return name;
    }

    public void setName(@Nullable String setterArg) {
      this.name = setterArg;
    }

    private @Nullable String description;

    public @Nullable String getDescription() {
      return description;
    }

    public void setDescription(@Nullable String setterArg) {
      this.description = setterArg;
    }

    private @NonNull Code code;

    public @NonNull Code getCode() {
      return code;
    }

    public void setCode(@NonNull Code setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"code\" is null.");
      }
      this.code = setterArg;
    }

    private @NonNull Map<String, String> data;

    public @NonNull Map<String, String> getData() {
      return data;
    }

    public void setData(@NonNull Map<String, String> setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"data\" is null.");
      }
      this.data = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    MessageData() {}

    public static final class Builder {

      private @Nullable String name;

      public @NonNull Builder setName(@Nullable String setterArg) {
        this.name = setterArg;
        return this;
      }

      private @Nullable String description;

      public @NonNull Builder setDescription(@Nullable String setterArg) {
        this.description = setterArg;
        return this;
      }

      private @Nullable Code code;

      public @NonNull Builder setCode(@NonNull Code setterArg) {
        this.code = setterArg;
        return this;
      }

      private @Nullable Map<String, String> data;

      public @NonNull Builder setData(@NonNull Map<String, String> setterArg) {
        this.data = setterArg;
        return this;
      }

      public @NonNull MessageData build() {
        MessageData pigeonReturn = new MessageData();
        pigeonReturn.setName(name);
        pigeonReturn.setDescription(description);
        pigeonReturn.setCode(code);
        pigeonReturn.setData(data);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(4);
      toListResult.add(name);
      toListResult.add(description);
      toListResult.add(code == null ? null : code.index);
      toListResult.add(data);
      return toListResult;
    }

    static @NonNull MessageData fromList(@NonNull ArrayList<Object> list) {
      MessageData pigeonResult = new MessageData();
      Object name = list.get(0);
      pigeonResult.setName((String) name);
      Object description = list.get(1);
      pigeonResult.setDescription((String) description);
      Object code = list.get(2);
      pigeonResult.setCode(Code.values()[(int) code]);
      Object data = list.get(3);
      pigeonResult.setData((Map<String, String>) data);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class Permission {
    private @NonNull String name;

    public @NonNull String getName() {
      return name;
    }

    public void setName(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"name\" is null.");
      }
      this.name = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    Permission() {}

    public static final class Builder {

      private @Nullable String name;

      public @NonNull Builder setName(@NonNull String setterArg) {
        this.name = setterArg;
        return this;
      }

      public @NonNull Permission build() {
        Permission pigeonReturn = new Permission();
        pigeonReturn.setName(name);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(1);
      toListResult.add(name);
      return toListResult;
    }

    static @NonNull Permission fromList(@NonNull ArrayList<Object> list) {
      Permission pigeonResult = new Permission();
      Object name = list.get(0);
      pigeonResult.setName((String) name);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class TikTokLoginResult {
    private @NonNull TikTokLoginStatus status;

    public @NonNull TikTokLoginStatus getStatus() {
      return status;
    }

    public void setStatus(@NonNull TikTokLoginStatus setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"status\" is null.");
      }
      this.status = setterArg;
    }

    private @Nullable String authCode;

    public @Nullable String getAuthCode() {
      return authCode;
    }

    public void setAuthCode(@Nullable String setterArg) {
      this.authCode = setterArg;
    }

    private @Nullable String state;

    public @Nullable String getState() {
      return state;
    }

    public void setState(@Nullable String setterArg) {
      this.state = setterArg;
    }

    private @Nullable String codeVerifier;

    public @Nullable String getCodeVerifier() {
      return codeVerifier;
    }

    public void setCodeVerifier(@Nullable String setterArg) {
      this.codeVerifier = setterArg;
    }

    private @NonNull List<Permission> grantedPermissions;

    public @NonNull List<Permission> getGrantedPermissions() {
      return grantedPermissions;
    }

    public void setGrantedPermissions(@NonNull List<Permission> setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"grantedPermissions\" is null.");
      }
      this.grantedPermissions = setterArg;
    }

    private @Nullable String errorCode;

    public @Nullable String getErrorCode() {
      return errorCode;
    }

    public void setErrorCode(@Nullable String setterArg) {
      this.errorCode = setterArg;
    }

    private @Nullable String errorMessage;

    public @Nullable String getErrorMessage() {
      return errorMessage;
    }

    public void setErrorMessage(@Nullable String setterArg) {
      this.errorMessage = setterArg;
    }

    private @NonNull String scopeName;

    public @NonNull String getScopeName() {
      return scopeName;
    }

    public void setScopeName(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"scopeName\" is null.");
      }
      this.scopeName = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    TikTokLoginResult() {}

    public static final class Builder {

      private @Nullable TikTokLoginStatus status;

      public @NonNull Builder setStatus(@NonNull TikTokLoginStatus setterArg) {
        this.status = setterArg;
        return this;
      }

      private @Nullable String authCode;

      public @NonNull Builder setAuthCode(@Nullable String setterArg) {
        this.authCode = setterArg;
        return this;
      }

      private @Nullable String state;

      public @NonNull Builder setState(@Nullable String setterArg) {
        this.state = setterArg;
        return this;
      }

      private @Nullable String codeVerifier;

      public @NonNull Builder setCodeVerifier(@Nullable String setterArg) {
        this.codeVerifier = setterArg;
        return this;
      }

      private @Nullable List<Permission> grantedPermissions;

      public @NonNull Builder setGrantedPermissions(@NonNull List<Permission> setterArg) {
        this.grantedPermissions = setterArg;
        return this;
      }

      private @Nullable String errorCode;

      public @NonNull Builder setErrorCode(@Nullable String setterArg) {
        this.errorCode = setterArg;
        return this;
      }

      private @Nullable String errorMessage;

      public @NonNull Builder setErrorMessage(@Nullable String setterArg) {
        this.errorMessage = setterArg;
        return this;
      }

      private @Nullable String scopeName;

      public @NonNull Builder setScopeName(@NonNull String setterArg) {
        this.scopeName = setterArg;
        return this;
      }

      public @NonNull TikTokLoginResult build() {
        TikTokLoginResult pigeonReturn = new TikTokLoginResult();
        pigeonReturn.setStatus(status);
        pigeonReturn.setAuthCode(authCode);
        pigeonReturn.setState(state);
        pigeonReturn.setCodeVerifier(codeVerifier);
        pigeonReturn.setGrantedPermissions(grantedPermissions);
        pigeonReturn.setErrorCode(errorCode);
        pigeonReturn.setErrorMessage(errorMessage);
        pigeonReturn.setScopeName(scopeName);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(8);
      toListResult.add(status == null ? null : status.index);
      toListResult.add(authCode);
      toListResult.add(state);
      toListResult.add(codeVerifier);
      toListResult.add(grantedPermissions);
      toListResult.add(errorCode);
      toListResult.add(errorMessage);
      toListResult.add(scopeName);
      return toListResult;
    }

    static @NonNull TikTokLoginResult fromList(@NonNull ArrayList<Object> list) {
      TikTokLoginResult pigeonResult = new TikTokLoginResult();
      Object status = list.get(0);
      pigeonResult.setStatus(TikTokLoginStatus.values()[(int) status]);
      Object authCode = list.get(1);
      pigeonResult.setAuthCode((String) authCode);
      Object state = list.get(2);
      pigeonResult.setState((String) state);
      Object codeVerifier = list.get(3);
      pigeonResult.setCodeVerifier((String) codeVerifier);
      Object grantedPermissions = list.get(4);
      pigeonResult.setGrantedPermissions((List<Permission>) grantedPermissions);
      Object errorCode = list.get(5);
      pigeonResult.setErrorCode((String) errorCode);
      Object errorMessage = list.get(6);
      pigeonResult.setErrorMessage((String) errorMessage);
      Object scopeName = list.get(7);
      pigeonResult.setScopeName((String) scopeName);
      return pigeonResult;
    }
  }

  /** Asynchronous error handling return type for non-nullable API method returns. */
  public interface Result<T> {
    /** Success case callback method for handling returns. */
    void success(@NonNull T result);

    /** Failure case callback method for handling errors. */
    void error(@NonNull Throwable error);
  }
  /** Asynchronous error handling return type for nullable API method returns. */
  public interface NullableResult<T> {
    /** Success case callback method for handling returns. */
    void success(@Nullable T result);

    /** Failure case callback method for handling errors. */
    void error(@NonNull Throwable error);
  }

  private static class ExampleHostApiCodec extends StandardMessageCodec {
    public static final ExampleHostApiCodec INSTANCE = new ExampleHostApiCodec();

    private ExampleHostApiCodec() {}

    @Override
    protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
      switch (type) {
        case (byte) 128:
          return MessageData.fromList((ArrayList<Object>) readValue(buffer));
        default:
          return super.readValueOfType(type, buffer);
      }
    }

    @Override
    protected void writeValue(@NonNull ByteArrayOutputStream stream, Object value) {
      if (value instanceof MessageData) {
        stream.write(128);
        writeValue(stream, ((MessageData) value).toList());
      } else {
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter. */
  public interface ExampleHostApi {

    @NonNull 
    String getHostLanguage();

    @NonNull 
    Long add(@NonNull Long a, @NonNull Long b);

    void sendMessage(@NonNull MessageData message, @NonNull Result<Boolean> result);

    /** The codec used by ExampleHostApi. */
    static @NonNull MessageCodec<Object> getCodec() {
      return ExampleHostApiCodec.INSTANCE;
    }
    /**Sets up an instance of `ExampleHostApi` to handle messages through the `binaryMessenger`. */
    static void setUp(@NonNull BinaryMessenger binaryMessenger, @Nullable ExampleHostApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.instagram_connect.ExampleHostApi.getHostLanguage", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                try {
                  String output = api.getHostLanguage();
                  wrapped.add(0, output);
                }
 catch (Throwable exception) {
                  ArrayList<Object> wrappedError = wrapError(exception);
                  wrapped = wrappedError;
                }
                reply.reply(wrapped);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.instagram_connect.ExampleHostApi.add", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                Number aArg = (Number) args.get(0);
                Number bArg = (Number) args.get(1);
                try {
                  Long output = api.add((aArg == null) ? null : aArg.longValue(), (bArg == null) ? null : bArg.longValue());
                  wrapped.add(0, output);
                }
 catch (Throwable exception) {
                  ArrayList<Object> wrappedError = wrapError(exception);
                  wrapped = wrappedError;
                }
                reply.reply(wrapped);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.instagram_connect.ExampleHostApi.sendMessage", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                MessageData messageArg = (MessageData) args.get(0);
                Result<Boolean> resultCallback =
                    new Result<Boolean>() {
                      public void success(Boolean result) {
                        wrapped.add(0, result);
                        reply.reply(wrapped);
                      }

                      public void error(Throwable error) {
                        ArrayList<Object> wrappedError = wrapError(error);
                        reply.reply(wrappedError);
                      }
                    };

                api.sendMessage(messageArg, resultCallback);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }

  private static class TiktokSDKApiCodec extends StandardMessageCodec {
    public static final TiktokSDKApiCodec INSTANCE = new TiktokSDKApiCodec();

    private TiktokSDKApiCodec() {}

    @Override
    protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
      switch (type) {
        case (byte) 128:
          return Permission.fromList((ArrayList<Object>) readValue(buffer));
        case (byte) 129:
          return TikTokLoginResult.fromList((ArrayList<Object>) readValue(buffer));
        default:
          return super.readValueOfType(type, buffer);
      }
    }

    @Override
    protected void writeValue(@NonNull ByteArrayOutputStream stream, Object value) {
      if (value instanceof Permission) {
        stream.write(128);
        writeValue(stream, ((Permission) value).toList());
      } else if (value instanceof TikTokLoginResult) {
        stream.write(129);
        writeValue(stream, ((TikTokLoginResult) value).toList());
      } else {
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter. */
  public interface TiktokSDKApi {

    void setup(@NonNull String clientKey, @NonNull Result<Void> result);

    void login(@NonNull List<String> permissions, @NonNull String redirectUri, @Nullable Boolean browserAuthEnabled, @NonNull Result<TikTokLoginResult> result);

    /** The codec used by TiktokSDKApi. */
    static @NonNull MessageCodec<Object> getCodec() {
      return TiktokSDKApiCodec.INSTANCE;
    }
    /**Sets up an instance of `TiktokSDKApi` to handle messages through the `binaryMessenger`. */
    static void setUp(@NonNull BinaryMessenger binaryMessenger, @Nullable TiktokSDKApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.instagram_connect.TiktokSDKApi.setup", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                String clientKeyArg = (String) args.get(0);
                Result<Void> resultCallback =
                    new Result<Void>() {
                      public void success(Void result) {
                        wrapped.add(0, null);
                        reply.reply(wrapped);
                      }

                      public void error(Throwable error) {
                        ArrayList<Object> wrappedError = wrapError(error);
                        reply.reply(wrappedError);
                      }
                    };

                api.setup(clientKeyArg, resultCallback);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.instagram_connect.TiktokSDKApi.login", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                List<String> permissionsArg = (List<String>) args.get(0);
                String redirectUriArg = (String) args.get(1);
                Boolean browserAuthEnabledArg = (Boolean) args.get(2);
                Result<TikTokLoginResult> resultCallback =
                    new Result<TikTokLoginResult>() {
                      public void success(TikTokLoginResult result) {
                        wrapped.add(0, result);
                        reply.reply(wrapped);
                      }

                      public void error(Throwable error) {
                        ArrayList<Object> wrappedError = wrapError(error);
                        reply.reply(wrappedError);
                      }
                    };

                api.login(permissionsArg, redirectUriArg, browserAuthEnabledArg, resultCallback);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
}
