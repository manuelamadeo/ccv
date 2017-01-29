.class public Lorg/apache/cordova/mediacapture/Capture;
.super Lorg/apache/cordova/CordovaPlugin;
.source "Capture.java"


# static fields
.field private static final AUDIO_3GPP:Ljava/lang/String; = "audio/3gpp"

.field private static final AUDIO_TYPES:[Ljava/lang/String;

.field private static final CAPTURE_AUDIO:I = 0x0

.field private static final CAPTURE_IMAGE:I = 0x1

.field private static final CAPTURE_INTERNAL_ERR:I = 0x0

.field private static final CAPTURE_NO_MEDIA_FILES:I = 0x3

.field private static final CAPTURE_PERMISSION_DENIED:I = 0x4

.field private static final CAPTURE_VIDEO:I = 0x2

.field private static final IMAGE_JPEG:Ljava/lang/String; = "image/jpeg"

.field private static final LOG_TAG:Ljava/lang/String; = "Capture"

.field private static final VIDEO_3GPP:Ljava/lang/String; = "video/3gpp"

.field private static final VIDEO_MP4:Ljava/lang/String; = "video/mp4"


# instance fields
.field private cameraPermissionInManifest:Z

.field private imageUri:Landroid/net/Uri;

.field private numPics:I

.field private final pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 65
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "audio/3gpp"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "audio/aac"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "audio/amr"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "audio/wav"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/cordova/mediacapture/Capture;->AUDIO_TYPES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 81
    new-instance v0, Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-direct {v0}, Lorg/apache/cordova/mediacapture/PendingRequests;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    return-void
.end method

.method private captureAudio(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V
    .locals 3
    .param p1, "req"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    .prologue
    .line 229
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v1}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 230
    iget v1, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v1, v2}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    .line 236
    :goto_0
    return-void

    .line 232
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.MediaStore.RECORD_SOUND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 234
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    iget v2, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    invoke-interface {v1, p0, v0, v2}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method private captureImage(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V
    .locals 10
    .param p1, "req"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 253
    const-string v7, "android.permission.READ_EXTERNAL_STORAGE"

    .line 254
    invoke-static {p0, v7}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    move v4, v5

    .line 256
    .local v4, "needExternalStoragePermission":Z
    :goto_0
    iget-boolean v7, p0, Lorg/apache/cordova/mediacapture/Capture;->cameraPermissionInManifest:Z

    if-eqz v7, :cond_2

    const-string v7, "android.permission.CAMERA"

    .line 257
    invoke-static {p0, v7}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2

    move v3, v5

    .line 259
    .local v3, "needCameraPermission":Z
    :goto_1
    if-nez v4, :cond_0

    if-eqz v3, :cond_5

    .line 260
    :cond_0
    if-eqz v4, :cond_3

    if-eqz v3, :cond_3

    .line 261
    iget v7, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/String;

    const-string v9, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v9, v8, v6

    const-string v6, "android.permission.CAMERA"

    aput-object v6, v8, v5

    invoke-static {p0, v7, v8}, Lorg/apache/cordova/PermissionHelper;->requestPermissions(Lorg/apache/cordova/CordovaPlugin;I[Ljava/lang/String;)V

    .line 283
    :goto_2
    return-void

    .end local v3    # "needCameraPermission":Z
    .end local v4    # "needExternalStoragePermission":Z
    :cond_1
    move v4, v6

    .line 254
    goto :goto_0

    .restart local v4    # "needExternalStoragePermission":Z
    :cond_2
    move v3, v6

    .line 257
    goto :goto_1

    .line 262
    .restart local v3    # "needCameraPermission":Z
    :cond_3
    if-eqz v4, :cond_4

    .line 263
    iget v5, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    const-string v6, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v5, v6}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    goto :goto_2

    .line 265
    :cond_4
    iget v5, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    const-string v6, "android.permission.CAMERA"

    invoke-static {p0, v5, v6}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    goto :goto_2

    .line 269
    :cond_5
    invoke-direct {p0}, Lorg/apache/cordova/mediacapture/Capture;->whichContentStore()Landroid/net/Uri;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/apache/cordova/mediacapture/Capture;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v5

    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    move-result v5

    iput v5, p0, Lorg/apache/cordova/mediacapture/Capture;->numPics:I

    .line 271
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 273
    .local v2, "intent":Landroid/content/Intent;
    iget-object v5, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 274
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 275
    .local v1, "cv":Landroid/content/ContentValues;
    const-string v5, "mime_type"

    const-string v6, "image/jpeg"

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    sget-object v5, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v5, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/cordova/mediacapture/Capture;->imageUri:Landroid/net/Uri;

    .line 277
    const-string v5, "Capture"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Taking a picture and saving to: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/cordova/mediacapture/Capture;->imageUri:Landroid/net/Uri;

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    const-string v5, "output"

    iget-object v6, p0, Lorg/apache/cordova/mediacapture/Capture;->imageUri:Landroid/net/Uri;

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 281
    iget-object v5, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    iget v6, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    invoke-interface {v5, p0, v2, v6}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    goto :goto_2
.end method

.method private captureVideo(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V
    .locals 3
    .param p1, "req"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    .prologue
    .line 294
    iget-boolean v1, p0, Lorg/apache/cordova/mediacapture/Capture;->cameraPermissionInManifest:Z

    if-eqz v1, :cond_0

    const-string v1, "android.permission.CAMERA"

    invoke-static {p0, v1}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 295
    iget v1, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    const-string v2, "android.permission.CAMERA"

    invoke-static {p0, v1, v2}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    .line 305
    :goto_0
    return-void

    .line 297
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.VIDEO_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 299
    .local v0, "intent":Landroid/content/Intent;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v2, 0x7

    if-le v1, v2, :cond_1

    .line 300
    const-string v1, "android.intent.extra.durationLimit"

    iget v2, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->duration:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 301
    const-string v1, "android.intent.extra.videoQuality"

    iget v2, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->quality:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 303
    :cond_1
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    iget v2, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    invoke-interface {v1, p0, v0, v2}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method private checkForDuplicateImage()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 515
    invoke-direct {p0}, Lorg/apache/cordova/mediacapture/Capture;->whichContentStore()Landroid/net/Uri;

    move-result-object v0

    .line 516
    .local v0, "contentStore":Landroid/net/Uri;
    invoke-direct {p0, v0}, Lorg/apache/cordova/mediacapture/Capture;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v2

    .line 517
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v1

    .line 520
    .local v1, "currentNumOfImages":I
    iget v5, p0, Lorg/apache/cordova/mediacapture/Capture;->numPics:I

    sub-int v5, v1, v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_0

    .line 521
    invoke-interface {v2}, Landroid/database/Cursor;->moveToLast()Z

    .line 522
    const-string v5, "_id"

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v3, v5, -0x1

    .line 523
    .local v3, "id":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 524
    .local v4, "uri":Landroid/net/Uri;
    iget-object v5, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v4, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 526
    .end local v3    # "id":I
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_0
    return-void
.end method

.method private createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 486
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 488
    .local v0, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "code"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 489
    const-string v1, "message"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 493
    :goto_0
    return-object v0

    .line 490
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;
    .locals 14
    .param p1, "data"    # Landroid/net/Uri;

    .prologue
    .line 433
    iget-object v11, p0, Lorg/apache/cordova/mediacapture/Capture;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v11}, Lorg/apache/cordova/CordovaWebView;->getResourceApi()Lorg/apache/cordova/CordovaResourceApi;

    move-result-object v11

    invoke-virtual {v11, p1}, Lorg/apache/cordova/CordovaResourceApi;->mapUriToFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object v4

    .line 434
    .local v4, "fp":Ljava/io/File;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 436
    .local v6, "obj":Lorg/json/JSONObject;
    iget-object v11, p0, Lorg/apache/cordova/mediacapture/Capture;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    .line 437
    .local v10, "webViewClass":Ljava/lang/Class;
    const/4 v7, 0x0

    .line 439
    .local v7, "pm":Lorg/apache/cordova/PluginManager;
    :try_start_0
    const-string v11, "getPluginManager"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 440
    .local v5, "gpm":Ljava/lang/reflect/Method;
    iget-object v11, p0, Lorg/apache/cordova/mediacapture/Capture;->webView:Lorg/apache/cordova/CordovaWebView;

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-virtual {v5, v11, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    move-object v0, v11

    check-cast v0, Lorg/apache/cordova/PluginManager;

    move-object v7, v0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3

    .line 445
    .end local v5    # "gpm":Ljava/lang/reflect/Method;
    :goto_0
    if-nez v7, :cond_0

    .line 447
    :try_start_1
    const-string v11, "pluginManager"

    invoke-virtual {v10, v11}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 448
    .local v8, "pmf":Ljava/lang/reflect/Field;
    iget-object v11, p0, Lorg/apache/cordova/mediacapture/Capture;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v8, v11}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    move-object v0, v11

    check-cast v0, Lorg/apache/cordova/PluginManager;

    move-object v7, v0
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    .line 453
    .end local v8    # "pmf":Ljava/lang/reflect/Field;
    :cond_0
    :goto_1
    const-string v11, "File"

    invoke-virtual {v7, v11}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v3

    check-cast v3, Lorg/apache/cordova/file/FileUtils;

    .line 454
    .local v3, "filePlugin":Lorg/apache/cordova/file/FileUtils;
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Lorg/apache/cordova/file/FileUtils;->filesystemURLforLocalPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v9

    .line 458
    .local v9, "url":Lorg/apache/cordova/file/LocalFilesystemURL;
    :try_start_2
    const-string v11, "name"

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 459
    const-string v11, "fullPath"

    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v12

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 460
    if-eqz v9, :cond_1

    .line 461
    const-string v11, "localURL"

    invoke-virtual {v9}, Lorg/apache/cordova/file/LocalFilesystemURL;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 466
    :cond_1
    invoke-virtual {v4}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, ".3gp"

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_2

    invoke-virtual {v4}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, ".3gpp"

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 467
    :cond_2
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "/audio/"

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 468
    const-string v11, "type"

    const-string v12, "audio/3gpp"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 476
    :goto_2
    const-string v11, "lastModifiedDate"

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    invoke-virtual {v6, v11, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 477
    const-string v11, "size"

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v12

    invoke-virtual {v6, v11, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 482
    :goto_3
    return-object v6

    .line 470
    :cond_3
    const-string v11, "type"

    const-string v12, "video/3gpp"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 478
    :catch_0
    move-exception v2

    .line 480
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_3

    .line 473
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_4
    :try_start_3
    const-string v11, "type"

    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v12, v13}, Lorg/apache/cordova/mediacapture/FileHelper;->getMimeType(Landroid/net/Uri;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 450
    .end local v3    # "filePlugin":Lorg/apache/cordova/file/FileUtils;
    .end local v9    # "url":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_1
    move-exception v11

    goto/16 :goto_1

    .line 449
    :catch_2
    move-exception v11

    goto/16 :goto_1

    .line 443
    :catch_3
    move-exception v11

    goto/16 :goto_0

    .line 442
    :catch_4
    move-exception v11

    goto/16 :goto_0

    .line 441
    :catch_5
    move-exception v11

    goto/16 :goto_0
.end method

.method private static createWritableFile(Ljava/io/File;)V
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 286
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z

    .line 287
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/io/File;->setWritable(ZZ)Z

    .line 288
    return-void
.end method

.method private executeRequest(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V
    .locals 1
    .param p1, "req"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    .prologue
    .line 541
    iget v0, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->action:I

    packed-switch v0, :pswitch_data_0

    .line 552
    :goto_0
    return-void

    .line 543
    :pswitch_0
    invoke-direct {p0, p1}, Lorg/apache/cordova/mediacapture/Capture;->captureAudio(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    .line 546
    :pswitch_1
    invoke-direct {p0, p1}, Lorg/apache/cordova/mediacapture/Capture;->captureImage(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    .line 549
    :pswitch_2
    invoke-direct {p0, p1}, Lorg/apache/cordova/mediacapture/Capture;->captureVideo(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    .line 541
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private getAudioVideoData(Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .locals 4
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "obj"    # Lorg/json/JSONObject;
    .param p3, "video"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 210
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    .line 212
    .local v1, "player":Landroid/media/MediaPlayer;
    :try_start_0
    invoke-virtual {v1, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 213
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 214
    const-string v2, "duration"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v3

    div-int/lit16 v3, v3, 0x3e8

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 215
    if-eqz p3, :cond_0

    .line 216
    const-string v2, "height"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 217
    const-string v2, "width"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    :cond_0
    :goto_0
    return-object p2

    .line 219
    :catch_0
    move-exception v0

    .line 220
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "Capture"

    const-string v3, "Error: loading video file"

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getFormatData(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 155
    const-string v2, "file:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 156
    .local v0, "fileUrl":Landroid/net/Uri;
    :goto_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 158
    .local v1, "obj":Lorg/json/JSONObject;
    const-string v2, "height"

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 159
    const-string v2, "width"

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 160
    const-string v2, "bitrate"

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 161
    const-string v2, "duration"

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 162
    const-string v2, "codecs"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 166
    if-eqz p2, :cond_0

    const-string v2, ""

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "null"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 167
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v0, v2}, Lorg/apache/cordova/mediacapture/FileHelper;->getMimeType(Landroid/net/Uri;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object p2

    .line 169
    :cond_1
    const-string v2, "Capture"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Mime type = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    const-string v2, "image/jpeg"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, ".jpg"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 172
    :cond_2
    invoke-direct {p0, v0, v1}, Lorg/apache/cordova/mediacapture/Capture;->getImageData(Landroid/net/Uri;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    .line 180
    :cond_3
    :goto_1
    return-object v1

    .line 155
    .end local v0    # "fileUrl":Landroid/net/Uri;
    .end local v1    # "obj":Lorg/json/JSONObject;
    :cond_4
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    .line 174
    .restart local v0    # "fileUrl":Landroid/net/Uri;
    .restart local v1    # "obj":Lorg/json/JSONObject;
    :cond_5
    sget-object v2, Lorg/apache/cordova/mediacapture/Capture;->AUDIO_TYPES:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 175
    invoke-direct {p0, p1, v1, v5}, Lorg/apache/cordova/mediacapture/Capture;->getAudioVideoData(Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_1

    .line 177
    :cond_6
    const-string v2, "video/3gpp"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string v2, "video/mp4"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 178
    :cond_7
    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v2}, Lorg/apache/cordova/mediacapture/Capture;->getAudioVideoData(Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_1
.end method

.method private getImageData(Landroid/net/Uri;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "fileUrl"    # Landroid/net/Uri;
    .param p2, "obj"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 192
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 193
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 194
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 195
    const-string v1, "height"

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 196
    const-string v1, "width"

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 197
    return-object p2
.end method

.method private getTempDirectoryPath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 239
    const/4 v0, 0x0

    .line 242
    .local v0, "cache":Ljava/io/File;
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 245
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 246
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;
    .locals 6
    .param p1, "contentStore"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 502
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v1

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private whichContentStore()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 533
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 534
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 536
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 123
    const-string v4, "getFormatData"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 124
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lorg/apache/cordova/mediacapture/Capture;->getFormatData(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 125
    .local v0, "obj":Lorg/json/JSONObject;
    invoke-virtual {p3, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 144
    .end local v0    # "obj":Lorg/json/JSONObject;
    :goto_0
    return v2

    .line 129
    :cond_0
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 131
    .local v1, "options":Lorg/json/JSONObject;
    const-string v4, "captureAudio"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 132
    iget-object v4, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v4, v3, v1, p3}, Lorg/apache/cordova/mediacapture/PendingRequests;->createRequest(ILorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/mediacapture/Capture;->captureAudio(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    .line 134
    :cond_1
    const-string v4, "captureImage"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 135
    iget-object v3, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v3, v2, v1, p3}, Lorg/apache/cordova/mediacapture/PendingRequests;->createRequest(ILorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/mediacapture/Capture;->captureImage(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    .line 137
    :cond_2
    const-string v4, "captureVideo"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 138
    iget-object v3, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    const/4 v4, 0x2

    invoke-virtual {v3, v4, v1, p3}, Lorg/apache/cordova/mediacapture/PendingRequests;->createRequest(ILorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/mediacapture/Capture;->captureVideo(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    :cond_3
    move v2, v3

    .line 141
    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x3

    .line 317
    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v2, p1}, Lorg/apache/cordova/mediacapture/PendingRequests;->get(I)Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    move-result-object v1

    .line 320
    .local v1, "req":Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    const/4 v2, -0x1

    if-ne p2, v2, :cond_0

    .line 321
    new-instance v0, Lorg/apache/cordova/mediacapture/Capture$1;

    invoke-direct {v0, p0, v1, p3}, Lorg/apache/cordova/mediacapture/Capture$1;-><init>(Lorg/apache/cordova/mediacapture/Capture;Lorg/apache/cordova/mediacapture/PendingRequests$Request;Landroid/content/Intent;)V

    .line 338
    .local v0, "processActivityResult":Ljava/lang/Runnable;
    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 362
    .end local v0    # "processActivityResult":Ljava/lang/Runnable;
    :goto_0
    return-void

    .line 341
    :cond_0
    if-nez p2, :cond_2

    .line 343
    iget-object v2, v1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 344
    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/mediacapture/PendingRequests;->resolveWithSuccess(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    .line 348
    :cond_1
    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    const-string v3, "Canceled."

    invoke-direct {p0, v4, v3}, Lorg/apache/cordova/mediacapture/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lorg/apache/cordova/mediacapture/PendingRequests;->resolveWithFailure(Lorg/apache/cordova/mediacapture/PendingRequests$Request;Lorg/json/JSONObject;)V

    goto :goto_0

    .line 354
    :cond_2
    iget-object v2, v1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 355
    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/mediacapture/PendingRequests;->resolveWithSuccess(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    .line 359
    :cond_3
    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    const-string v3, "Did not complete!"

    invoke-direct {p0, v4, v3}, Lorg/apache/cordova/mediacapture/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lorg/apache/cordova/mediacapture/PendingRequests;->resolveWithFailure(Lorg/apache/cordova/mediacapture/PendingRequests$Request;Lorg/json/JSONObject;)V

    goto :goto_0
.end method

.method public onAudioActivityResult(Lorg/apache/cordova/mediacapture/PendingRequests$Request;Landroid/content/Intent;)V
    .locals 6
    .param p1, "req"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 367
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 369
    .local v0, "data":Landroid/net/Uri;
    iget-object v1, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    invoke-direct {p0, v0}, Lorg/apache/cordova/mediacapture/Capture;->createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 371
    iget-object v1, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    int-to-long v2, v1

    iget-wide v4, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->limit:J

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    .line 373
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v1, p1}, Lorg/apache/cordova/mediacapture/PendingRequests;->resolveWithSuccess(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    .line 378
    :goto_0
    return-void

    .line 376
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/cordova/mediacapture/Capture;->captureAudio(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0
.end method

.method public onImageActivityResult(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V
    .locals 4
    .param p1, "req"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    .prologue
    .line 382
    iget-object v0, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture;->imageUri:Landroid/net/Uri;

    invoke-direct {p0, v1}, Lorg/apache/cordova/mediacapture/Capture;->createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 384
    invoke-direct {p0}, Lorg/apache/cordova/mediacapture/Capture;->checkForDuplicateImage()V

    .line 386
    iget-object v0, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    int-to-long v0, v0

    iget-wide v2, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->limit:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 388
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/mediacapture/PendingRequests;->resolveWithSuccess(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    .line 393
    :goto_0
    return-void

    .line 391
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/cordova/mediacapture/Capture;->captureImage(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 556
    iget-object v3, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v3, p1}, Lorg/apache/cordova/mediacapture/PendingRequests;->get(I)Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    move-result-object v1

    .line 558
    .local v1, "req":Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    if-eqz v1, :cond_1

    .line 559
    const/4 v2, 0x1

    .line 560
    .local v2, "success":Z
    array-length v4, p3

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_0

    aget v0, p3, v3

    .line 561
    .local v0, "r":I
    const/4 v5, -0x1

    if-ne v0, v5, :cond_2

    .line 562
    const/4 v2, 0x0

    .line 567
    .end local v0    # "r":I
    :cond_0
    if-eqz v2, :cond_3

    .line 568
    invoke-direct {p0, v1}, Lorg/apache/cordova/mediacapture/Capture;->executeRequest(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    .line 573
    .end local v2    # "success":Z
    :cond_1
    :goto_1
    return-void

    .line 560
    .restart local v0    # "r":I
    .restart local v2    # "success":Z
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 570
    .end local v0    # "r":I
    :cond_3
    iget-object v3, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    const/4 v4, 0x4

    const-string v5, "Permission denied."

    invoke-direct {p0, v4, v5}, Lorg/apache/cordova/mediacapture/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lorg/apache/cordova/mediacapture/PendingRequests;->resolveWithFailure(Lorg/apache/cordova/mediacapture/PendingRequests$Request;Lorg/json/JSONObject;)V

    goto :goto_1
.end method

.method public onRestoreStateForActivityResult(Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 580
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/mediacapture/PendingRequests;->setLastSavedState(Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;)V

    .line 581
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 576
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v0}, Lorg/apache/cordova/mediacapture/PendingRequests;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public onVideoActivityResult(Lorg/apache/cordova/mediacapture/PendingRequests$Request;Landroid/content/Intent;)V
    .locals 6
    .param p1, "req"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 396
    const/4 v0, 0x0

    .line 398
    .local v0, "data":Landroid/net/Uri;
    if-eqz p2, :cond_0

    .line 400
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 403
    :cond_0
    if-nez v0, :cond_1

    .line 404
    new-instance v1, Ljava/io/File;

    invoke-direct {p0}, Lorg/apache/cordova/mediacapture/Capture;->getTempDirectoryPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Capture.avi"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    .local v1, "movie":Ljava/io/File;
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 409
    .end local v1    # "movie":Ljava/io/File;
    :cond_1
    if-nez v0, :cond_2

    .line 410
    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    const/4 v3, 0x3

    const-string v4, "Error: data is null"

    invoke-direct {p0, v3, v4}, Lorg/apache/cordova/mediacapture/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lorg/apache/cordova/mediacapture/PendingRequests;->resolveWithFailure(Lorg/apache/cordova/mediacapture/PendingRequests$Request;Lorg/json/JSONObject;)V

    .line 423
    :goto_0
    return-void

    .line 413
    :cond_2
    iget-object v2, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    invoke-direct {p0, v0}, Lorg/apache/cordova/mediacapture/Capture;->createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 415
    iget-object v2, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    int-to-long v2, v2

    iget-wide v4, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->limit:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3

    .line 417
    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture;->pendingRequests:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-virtual {v2, p1}, Lorg/apache/cordova/mediacapture/PendingRequests;->resolveWithSuccess(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    .line 420
    :cond_3
    invoke-direct {p0, p1}, Lorg/apache/cordova/mediacapture/Capture;->captureVideo(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0
.end method

.method protected pluginInitialize()V
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 96
    invoke-super {p0}, Lorg/apache/cordova/CordovaPlugin;->pluginInitialize()V

    .line 102
    iput-boolean v4, p0, Lorg/apache/cordova/mediacapture/Capture;->cameraPermissionInManifest:Z

    .line 104
    :try_start_0
    iget-object v5, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 105
    .local v1, "packageManager":Landroid/content/pm/PackageManager;
    iget-object v5, p0, Lorg/apache/cordova/mediacapture/Capture;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x1000

    invoke-virtual {v1, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iget-object v3, v5, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    .line 106
    .local v3, "permissionsInPackage":[Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 107
    array-length v5, v3

    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v2, v3, v4

    .line 108
    .local v2, "permission":Ljava/lang/String;
    const-string v6, "android.permission.CAMERA"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 109
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/cordova/mediacapture/Capture;->cameraPermissionInManifest:Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .end local v1    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v2    # "permission":Ljava/lang/String;
    .end local v3    # "permissionsInPackage":[Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 107
    .restart local v1    # "packageManager":Landroid/content/pm/PackageManager;
    .restart local v2    # "permission":Ljava/lang/String;
    .restart local v3    # "permissionsInPackage":[Ljava/lang/String;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 114
    .end local v1    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v2    # "permission":Ljava/lang/String;
    .end local v3    # "permissionsInPackage":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 117
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "Capture"

    const-string v5, "Failed checking for CAMERA permission in manifest"

    invoke-static {v4, v5, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
