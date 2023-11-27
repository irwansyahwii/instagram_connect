package com.example.instagram_connect


import android.app.Activity
import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import com.tiktok.open.sdk.auth.AuthApi
import com.tiktok.open.sdk.auth.AuthRequest
import com.tiktok.open.sdk.auth.utils.PKCEUtils
import android.content.Intent
import android.net.Uri
import android.os.Bundle


class MainActivity: FlutterActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)


    // ATTENTION: This was auto-generated to handle app links.
    val appLinkIntent: Intent = intent
    val appLinkAction: String? = appLinkIntent.action
    val appLinkData: Uri? = appLinkIntent.data

  }
override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

//    val api = PigeonApiImplementation()
//    ExampleHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, api);

    val tiktokApi = TiktokAPISDKImplementation(this);
    TiktokSDKApi.setUp(flutterEngine.dartExecutor.binaryMessenger, tiktokApi);
  }  
}



private  class TiktokAPISDKImplementation(val _activity: Activity): TiktokSDKApi{

  var activity: Activity;
  private lateinit var authApi: AuthApi
  private lateinit var clientKey: String


  init {
      this.activity = _activity;
  }

  override fun setup(clientKey: String, callback: (Result<Unit>) -> Unit) {

    if  (this.activity == null) {
      callback(Result.failure(exception = UnsupportedOperationException()))
      return
    }

    this.clientKey = clientKey
    this.authApi = AuthApi(activity = this.activity)


//    assert(this.authApi != null){"this.authApi is null" }

    callback(Result.success(Unit))
  }

  override fun login(
    permissions: List<String>,
    redirectUri: String,
    browserAuthEnabled: Boolean?,
    callback: (Result<TikTokLoginResult>) -> Unit
  ) {
    val codeVerifier = PKCEUtils.generateCodeVerifier()

    val request = AuthRequest(
      clientKey = clientKey,
      scope = "user.info.basic",
      redirectUri = redirectUri,
      codeVerifier = codeVerifier
    )

// STEP 3: Invoke the authorize method
    val isLoginSuccess = authApi.authorize(
      request = request,
      authMethod = AuthApi.AuthMethod.TikTokApp // AuthApi.AuthMethod.TikTokApp // / AuthMethod.ChromeTab
    );

    var loginStatus: TikTokLoginStatus = TikTokLoginStatus.SUCCESS
    if(!isLoginSuccess){
      loginStatus = TikTokLoginStatus.ERROR
    }

    callback(Result.success(
      TikTokLoginResult(
        status = loginStatus,
        scopeName = "",
        grantedPermissions = emptyList()
      )
    ))
  }




}



private class PigeonApiImplementation: ExampleHostApi {
  override fun getHostLanguage(): String {
    return "Kotlin"
  }

  override fun add(a: Long, b: Long): Long {
    if (a < 0L || b < 0L) {
      throw FlutterError("code", "message", "details");
    }
    return a + b
  }

  override fun sendMessage(message: MessageData, callback: (Result<Boolean>) -> Unit) {
    if (message.code == Code.ONE) {
      callback(Result.failure(FlutterError("code", "message", "details")))
      return
    }
    callback(Result.success(true))
  }
}