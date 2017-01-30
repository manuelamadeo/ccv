.class Lorg/apache/cordova/filetransfer/FileTransfer$1;
.super Ljava/lang/Object;
.source "FileTransfer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/filetransfer/FileTransfer;->upload(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

.field final synthetic val$chunkedMode:Z

.field final synthetic val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

.field final synthetic val$fileKey:Ljava/lang/String;

.field final synthetic val$fileName:Ljava/lang/String;

.field final synthetic val$headers:Lorg/json/JSONObject;

.field final synthetic val$httpMethod:Ljava/lang/String;

.field final synthetic val$mimeType:Ljava/lang/String;

.field final synthetic val$objectId:Ljava/lang/String;

.field final synthetic val$params:Lorg/json/JSONObject;

.field final synthetic val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

.field final synthetic val$source:Ljava/lang/String;

.field final synthetic val$target:Ljava/lang/String;

.field final synthetic val$targetUri:Landroid/net/Uri;

.field final synthetic val$trustEveryone:Z

.field final synthetic val$useHttps:Z


# direct methods
.method constructor <init>(Lorg/apache/cordova/filetransfer/FileTransfer;Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;Ljava/lang/String;Lorg/apache/cordova/CordovaResourceApi;Landroid/net/Uri;ZZLjava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/cordova/filetransfer/FileTransfer;

    .prologue
    .line 323
    iput-object p1, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

    iput-object p2, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    iput-object p3, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$source:Ljava/lang/String;

    iput-object p4, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    iput-object p5, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$targetUri:Landroid/net/Uri;

    iput-boolean p6, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    iput-boolean p7, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    iput-object p8, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$httpMethod:Ljava/lang/String;

    iput-object p9, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$headers:Lorg/json/JSONObject;

    iput-object p10, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$target:Ljava/lang/String;

    iput-object p11, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$params:Lorg/json/JSONObject;

    iput-object p12, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$fileKey:Ljava/lang/String;

    iput-object p13, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$fileName:Ljava/lang/String;

    iput-object p14, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$mimeType:Ljava/lang/String;

    move/from16 v0, p15

    iput-boolean v0, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$chunkedMode:Z

    move-object/from16 v0, p16

    iput-object v0, p0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$objectId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 44

    .prologue
    .line 325
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->aborted:Z

    move/from16 v39, v0

    if-eqz v39, :cond_1

    .line 579
    :cond_0
    :goto_0
    return-void

    .line 332
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$source:Ljava/lang/String;

    move-object/from16 v39, v0

    invoke-static/range {v39 .. v39}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v36

    .line 333
    .local v36, "tmpSrc":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    move-object/from16 v39, v0

    .line 334
    invoke-virtual/range {v36 .. v36}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v40

    if-eqz v40, :cond_e

    .line 333
    .end local v36    # "tmpSrc":Landroid/net/Uri;
    :goto_1
    move-object/from16 v0, v39

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v32

    .line 336
    .local v32, "sourceUri":Landroid/net/Uri;
    const/4 v10, 0x0

    .line 337
    .local v10, "conn":Ljava/net/HttpURLConnection;
    const/16 v20, 0x0

    .line 338
    .local v20, "oldHostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    const/16 v21, 0x0

    .line 339
    .local v21, "oldSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    const/16 v37, 0x0

    .line 340
    .local v37, "totalBytes":I
    const/4 v14, -0x1

    .line 343
    .local v14, "fixedLength":I
    :try_start_0
    new-instance v30, Lorg/apache/cordova/filetransfer/FileUploadResult;

    invoke-direct/range {v30 .. v30}, Lorg/apache/cordova/filetransfer/FileUploadResult;-><init>()V

    .line 344
    .local v30, "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    new-instance v23, Lorg/apache/cordova/filetransfer/FileProgressResult;

    invoke-direct/range {v23 .. v23}, Lorg/apache/cordova/filetransfer/FileProgressResult;-><init>()V

    .line 348
    .local v23, "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    move-object/from16 v39, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$targetUri:Landroid/net/Uri;

    move-object/from16 v40, v0

    invoke-virtual/range {v39 .. v40}, Lorg/apache/cordova/CordovaResourceApi;->createHttpConnection(Landroid/net/Uri;)Ljava/net/HttpURLConnection;

    move-result-object v10

    .line 349
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v39, v0

    if-eqz v39, :cond_2

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    move/from16 v39, v0

    if-eqz v39, :cond_2

    .line 351
    move-object v0, v10

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object v15, v0

    .line 352
    .local v15, "https":Ljavax/net/ssl/HttpsURLConnection;
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->trustAllHosts(Ljavax/net/ssl/HttpsURLConnection;)Ljavax/net/ssl/SSLSocketFactory;
    invoke-static {v15}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$000(Ljavax/net/ssl/HttpsURLConnection;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v21

    .line 354
    invoke-virtual {v15}, Ljavax/net/ssl/HttpsURLConnection;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v20

    .line 356
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$100()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 360
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_2
    const/16 v39, 0x1

    move/from16 v0, v39

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 363
    const/16 v39, 0x1

    move/from16 v0, v39

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 366
    const/16 v39, 0x0

    move/from16 v0, v39

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 369
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$httpMethod:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 372
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v39, v0

    if-eqz v39, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v39, v0

    const-string v40, "Content-Type"

    invoke-virtual/range {v39 .. v40}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_f

    :cond_3
    const/16 v19, 0x1

    .line 373
    .local v19, "multipartFormUpload":Z
    :goto_2
    if-eqz v19, :cond_4

    .line 374
    const-string v39, "Content-Type"

    const-string v40, "multipart/form-data; boundary=+++++"

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-virtual {v10, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

    move-object/from16 v39, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$target:Ljava/lang/String;

    move-object/from16 v40, v0

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->getCookies(Ljava/lang/String;)Ljava/lang/String;
    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$200(Lorg/apache/cordova/filetransfer/FileTransfer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 380
    .local v11, "cookie":Ljava/lang/String;
    if-eqz v11, :cond_5

    .line 381
    const-string v39, "Cookie"

    move-object/from16 v0, v39

    invoke-virtual {v10, v0, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v39, v0

    if-eqz v39, :cond_6

    .line 386
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->addHeadersToRequest(Ljava/net/URLConnection;Lorg/json/JSONObject;)V
    invoke-static {v10, v0}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/net/URLConnection;Lorg/json/JSONObject;)V

    .line 393
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_7

    .line 395
    .local v4, "beforeData":Ljava/lang/StringBuilder;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$params:Lorg/json/JSONObject;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_7
    :goto_3
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v39

    if-eqz v39, :cond_8

    .line 396
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    .line 397
    .local v18, "key":Ljava/lang/Object;
    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v39

    const-string v40, "headers"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_7

    .line 399
    const-string v39, "--"

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, "+++++"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, "\r\n"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    const-string v39, "Content-Disposition: form-data; name=\""

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const/16 v40, 0x22

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 401
    const-string v39, "\r\n"

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, "\r\n"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$params:Lorg/json/JSONObject;

    move-object/from16 v39, v0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    const-string v39, "\r\n"

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_7

    goto :goto_3

    .line 406
    .end local v17    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v18    # "key":Ljava/lang/Object;
    :catch_0
    move-exception v12

    .line 407
    .local v12, "e":Lorg/json/JSONException;
    :try_start_2
    const-string v39, "FileTransfer"

    invoke-virtual {v12}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-static {v0, v1, v12}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 410
    .end local v12    # "e":Lorg/json/JSONException;
    :cond_8
    const-string v39, "--"

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, "+++++"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, "\r\n"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    const-string v39, "Content-Disposition: form-data; name=\""

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$fileKey:Ljava/lang/String;

    move-object/from16 v40, v0

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, "\";"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    const-string v39, " filename=\""

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$fileName:Ljava/lang/String;

    move-object/from16 v40, v0

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const/16 v40, 0x22

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, "\r\n"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    const-string v39, "Content-Type: "

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$mimeType:Ljava/lang/String;

    move-object/from16 v40, v0

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, "\r\n"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, "\r\n"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v39

    const-string v40, "UTF-8"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    .line 415
    .local v5, "beforeDataBytes":[B
    const-string v39, "\r\n--+++++--\r\n"

    const-string v40, "UTF-8"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v35

    .line 419
    .local v35, "tailParamsBytes":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object v27

    .line 421
    .local v27, "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    array-length v0, v5

    move/from16 v39, v0

    move-object/from16 v0, v35

    array-length v0, v0

    move/from16 v40, v0

    add-int v33, v39, v40

    .line 422
    .local v33, "stringLength":I
    move-object/from16 v0, v27

    iget-wide v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    move-wide/from16 v40, v0

    const-wide/16 v42, 0x0

    cmp-long v39, v40, v42

    if-ltz v39, :cond_a

    .line 423
    move-object/from16 v0, v27

    iget-wide v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    move-wide/from16 v40, v0

    move-wide/from16 v0, v40

    long-to-int v14, v0

    .line 424
    if-eqz v19, :cond_9

    .line 425
    add-int v14, v14, v33

    .line 426
    :cond_9
    const/16 v39, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setLengthComputable(Z)V

    .line 427
    int-to-long v0, v14

    move-wide/from16 v40, v0

    move-object/from16 v0, v23

    move-wide/from16 v1, v40

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setTotal(J)V

    .line 429
    :cond_a
    const-string v39, "FileTransfer"

    new-instance v40, Ljava/lang/StringBuilder;

    invoke-direct/range {v40 .. v40}, Ljava/lang/StringBuilder;-><init>()V

    const-string v41, "Content Length: "

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    move-object/from16 v0, v40

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$chunkedMode:Z

    move/from16 v39, v0

    if-nez v39, :cond_b

    sget v39, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v40, 0x8

    move/from16 v0, v39

    move/from16 v1, v40

    if-ge v0, v1, :cond_10

    :cond_b
    const/16 v38, 0x1

    .line 434
    .local v38, "useChunkedMode":Z
    :goto_4
    if-nez v38, :cond_c

    const/16 v39, -0x1

    move/from16 v0, v39

    if-ne v14, v0, :cond_11

    :cond_c
    const/16 v38, 0x1

    .line 436
    :goto_5
    if-eqz v38, :cond_12

    .line 437
    const/16 v39, 0x4000

    move/from16 v0, v39

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 440
    const-string v39, "Transfer-Encoding"

    const-string v40, "chunked"

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-virtual {v10, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    :cond_d
    :goto_6
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->connect()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_7

    .line 451
    const/16 v31, 0x0

    .line 453
    .local v31, "sendStream":Ljava/io/OutputStream;
    :try_start_3
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v31

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v40, v0

    monitor-enter v40
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 455
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->aborted:Z

    move/from16 v39, v0

    if-eqz v39, :cond_13

    .line 456
    monitor-exit v40
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 502
    :try_start_5
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v39, v0

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v39 .. v39}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/io/Closeable;)V

    .line 503
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v31 .. v31}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/io/Closeable;)V
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_7

    .line 566
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v40

    monitor-enter v40

    .line 567
    :try_start_6
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$objectId:Ljava/lang/String;

    move-object/from16 v41, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    monitor-exit v40
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 570
    if-eqz v10, :cond_0

    .line 572
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object v15, v10

    .line 573
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 574
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 575
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 334
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v10    # "conn":Ljava/net/HttpURLConnection;
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v14    # "fixedLength":I
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .end local v19    # "multipartFormUpload":Z
    .end local v20    # "oldHostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    .end local v21    # "oldSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v32    # "sourceUri":Landroid/net/Uri;
    .end local v33    # "stringLength":I
    .end local v35    # "tailParamsBytes":[B
    .end local v37    # "totalBytes":I
    .end local v38    # "useChunkedMode":Z
    .restart local v36    # "tmpSrc":Landroid/net/Uri;
    :cond_e
    new-instance v40, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$source:Ljava/lang/String;

    move-object/from16 v41, v0

    invoke-direct/range {v40 .. v41}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static/range {v40 .. v40}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v36

    goto/16 :goto_1

    .line 372
    .end local v36    # "tmpSrc":Landroid/net/Uri;
    .restart local v10    # "conn":Ljava/net/HttpURLConnection;
    .restart local v14    # "fixedLength":I
    .restart local v20    # "oldHostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    .restart local v21    # "oldSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v32    # "sourceUri":Landroid/net/Uri;
    .restart local v37    # "totalBytes":I
    :cond_f
    const/16 v19, 0x0

    goto/16 :goto_2

    .line 433
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v33    # "stringLength":I
    .restart local v35    # "tailParamsBytes":[B
    :cond_10
    const/16 v38, 0x0

    goto/16 :goto_4

    .line 434
    .restart local v38    # "useChunkedMode":Z
    :cond_11
    const/16 v38, 0x0

    goto/16 :goto_5

    .line 442
    :cond_12
    :try_start_7
    invoke-virtual {v10, v14}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 444
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v39, v0

    if-eqz v39, :cond_d

    .line 445
    const-string v39, "FileTransfer"

    const-string v40, "setFixedLengthStreamingMode could cause OutOfMemoryException - switch to chunkedMode=true to avoid it if this is an issue."

    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    goto/16 :goto_6

    .line 548
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v33    # "stringLength":I
    .end local v35    # "tailParamsBytes":[B
    .end local v38    # "useChunkedMode":Z
    :catch_1
    move-exception v12

    .line 549
    .local v12, "e":Ljava/io/FileNotFoundException;
    :try_start_8
    sget v39, Lorg/apache/cordova/filetransfer/FileTransfer;->FILE_NOT_FOUND_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$source:Ljava/lang/String;

    move-object/from16 v40, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$target:Ljava/lang/String;

    move-object/from16 v41, v0

    move/from16 v0, v39

    move-object/from16 v1, v40

    move-object/from16 v2, v41

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;Ljava/lang/Throwable;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v10, v12}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v13

    .line 550
    .local v13, "error":Lorg/json/JSONObject;
    const-string v39, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-static {v0, v1, v12}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 551
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    new-instance v40, Lorg/apache/cordova/PluginResult;

    sget-object v41, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v40

    move-object/from16 v1, v41

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual/range {v39 .. v40}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_7

    .line 566
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v40

    monitor-enter v40

    .line 567
    :try_start_9
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$objectId:Ljava/lang/String;

    move-object/from16 v41, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    monitor-exit v40
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_c

    .line 570
    if-eqz v10, :cond_0

    .line 572
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object v15, v10

    .line 573
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 574
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 575
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 568
    .end local v12    # "e":Ljava/io/FileNotFoundException;
    .end local v13    # "error":Lorg/json/JSONObject;
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v33    # "stringLength":I
    .restart local v35    # "tailParamsBytes":[B
    .restart local v38    # "useChunkedMode":Z
    :catchall_0
    move-exception v39

    :try_start_a
    monitor-exit v40
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    throw v39

    .line 458
    :cond_13
    :try_start_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    iput-object v10, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 459
    monitor-exit v40
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 461
    if-eqz v19, :cond_14

    .line 463
    :try_start_c
    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/io/OutputStream;->write([B)V

    .line 464
    array-length v0, v5

    move/from16 v39, v0

    add-int v37, v37, v39

    .line 468
    :cond_14
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Ljava/io/InputStream;->available()I

    move-result v8

    .line 469
    .local v8, "bytesAvailable":I
    const/16 v39, 0x4000

    move/from16 v0, v39

    invoke-static {v8, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 470
    .local v7, "bufferSize":I
    new-array v6, v7, [B

    .line 473
    .local v6, "buffer":[B
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    move-object/from16 v0, v39

    move/from16 v1, v40

    invoke-virtual {v0, v6, v1, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v9

    .line 475
    .local v9, "bytesRead":I
    const-wide/16 v24, 0x0

    .line 476
    .local v24, "prevBytesRead":J
    :goto_7
    if-lez v9, :cond_16

    .line 477
    add-int v37, v37, v9

    .line 478
    move/from16 v0, v37

    int-to-long v0, v0

    move-wide/from16 v40, v0

    move-object/from16 v0, v30

    move-wide/from16 v1, v40

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/filetransfer/FileUploadResult;->setBytesSent(J)V

    .line 479
    const/16 v39, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v39

    invoke-virtual {v0, v6, v1, v9}, Ljava/io/OutputStream;->write([BII)V

    .line 480
    move/from16 v0, v37

    int-to-long v0, v0

    move-wide/from16 v40, v0

    const-wide/32 v42, 0x19000

    add-long v42, v42, v24

    cmp-long v39, v40, v42

    if-lez v39, :cond_15

    .line 481
    move/from16 v0, v37

    int-to-long v0, v0

    move-wide/from16 v24, v0

    .line 482
    const-string v39, "FileTransfer"

    new-instance v40, Ljava/lang/StringBuilder;

    invoke-direct/range {v40 .. v40}, Ljava/lang/StringBuilder;-><init>()V

    const-string v41, "Uploaded "

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    move-object/from16 v0, v40

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v40

    const-string v41, " of "

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    move-object/from16 v0, v40

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v40

    const-string v41, " bytes"

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    :cond_15
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Ljava/io/InputStream;->available()I

    move-result v8

    .line 485
    const/16 v39, 0x4000

    move/from16 v0, v39

    invoke-static {v8, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 486
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    move-object/from16 v0, v39

    move/from16 v1, v40

    invoke-virtual {v0, v6, v1, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v9

    .line 489
    move/from16 v0, v37

    int-to-long v0, v0

    move-wide/from16 v40, v0

    move-object/from16 v0, v23

    move-wide/from16 v1, v40

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setLoaded(J)V

    .line 490
    new-instance v26, Lorg/apache/cordova/PluginResult;

    sget-object v39, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v23 .. v23}, Lorg/apache/cordova/filetransfer/FileProgressResult;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v40

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    move-object/from16 v2, v40

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 491
    .local v26, "progressResult":Lorg/apache/cordova/PluginResult;
    const/16 v39, 0x1

    move-object/from16 v0, v26

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 492
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    goto/16 :goto_7

    .line 502
    .end local v6    # "buffer":[B
    .end local v7    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v24    # "prevBytesRead":J
    .end local v26    # "progressResult":Lorg/apache/cordova/PluginResult;
    :catchall_1
    move-exception v39

    :try_start_d
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v40, v0

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v40 .. v40}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/io/Closeable;)V

    .line 503
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v31 .. v31}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/io/Closeable;)V

    throw v39
    :try_end_d
    .catch Ljava/io/FileNotFoundException; {:try_start_d .. :try_end_d} :catch_1
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_2
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 552
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v33    # "stringLength":I
    .end local v35    # "tailParamsBytes":[B
    .end local v38    # "useChunkedMode":Z
    :catch_2
    move-exception v12

    .line 553
    .local v12, "e":Ljava/io/IOException;
    :try_start_e
    sget v39, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$source:Ljava/lang/String;

    move-object/from16 v40, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$target:Ljava/lang/String;

    move-object/from16 v41, v0

    move/from16 v0, v39

    move-object/from16 v1, v40

    move-object/from16 v2, v41

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;Ljava/lang/Throwable;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v10, v12}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v13

    .line 554
    .restart local v13    # "error":Lorg/json/JSONObject;
    const-string v39, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-static {v0, v1, v12}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 555
    const-string v39, "FileTransfer"

    new-instance v40, Ljava/lang/StringBuilder;

    invoke-direct/range {v40 .. v40}, Ljava/lang/StringBuilder;-><init>()V

    const-string v41, "Failed after uploading "

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    move-object/from16 v0, v40

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v40

    const-string v41, " of "

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    move-object/from16 v0, v40

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v40

    const-string v41, " bytes."

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 556
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    new-instance v40, Lorg/apache/cordova/PluginResult;

    sget-object v41, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v40

    move-object/from16 v1, v41

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual/range {v39 .. v40}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    .line 566
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v40

    monitor-enter v40

    .line 567
    :try_start_f
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$objectId:Ljava/lang/String;

    move-object/from16 v41, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    monitor-exit v40
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_d

    .line 570
    if-eqz v10, :cond_0

    .line 572
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object v15, v10

    .line 573
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 574
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 575
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 459
    .end local v12    # "e":Ljava/io/IOException;
    .end local v13    # "error":Lorg/json/JSONObject;
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v33    # "stringLength":I
    .restart local v35    # "tailParamsBytes":[B
    .restart local v38    # "useChunkedMode":Z
    :catchall_2
    move-exception v39

    :try_start_10
    monitor-exit v40
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    :try_start_11
    throw v39

    .line 495
    .restart local v6    # "buffer":[B
    .restart local v7    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v24    # "prevBytesRead":J
    :cond_16
    if-eqz v19, :cond_17

    .line 497
    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 498
    move-object/from16 v0, v35

    array-length v0, v0

    move/from16 v39, v0

    add-int v37, v37, v39

    .line 500
    :cond_17
    invoke-virtual/range {v31 .. v31}, Ljava/io/OutputStream;->flush()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    .line 502
    :try_start_12
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v39, v0

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v39 .. v39}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/io/Closeable;)V

    .line 503
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v31 .. v31}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/io/Closeable;)V

    .line 505
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v40, v0

    monitor-enter v40
    :try_end_12
    .catch Ljava/io/FileNotFoundException; {:try_start_12 .. :try_end_12} :catch_1
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_2
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_12} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_4
    .catchall {:try_start_12 .. :try_end_12} :catchall_7

    .line 506
    :try_start_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    const/16 v41, 0x0

    move-object/from16 v0, v41

    move-object/from16 v1, v39

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 507
    monitor-exit v40
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    .line 508
    :try_start_14
    const-string v39, "FileTransfer"

    new-instance v40, Ljava/lang/StringBuilder;

    invoke-direct/range {v40 .. v40}, Ljava/lang/StringBuilder;-><init>()V

    const-string v41, "Sent "

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    move-object/from16 v0, v40

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v40

    const-string v41, " of "

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    move-object/from16 v0, v40

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v28

    .line 513
    .local v28, "responseCode":I
    const-string v39, "FileTransfer"

    new-instance v40, Ljava/lang/StringBuilder;

    invoke-direct/range {v40 .. v40}, Ljava/lang/StringBuilder;-><init>()V

    const-string v41, "response code: "

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    move-object/from16 v0, v40

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    const-string v39, "FileTransfer"

    new-instance v40, Ljava/lang/StringBuilder;

    invoke-direct/range {v40 .. v40}, Ljava/lang/StringBuilder;-><init>()V

    const-string v41, "response headers: "

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v40

    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v41

    invoke-virtual/range {v40 .. v41}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_14
    .catch Ljava/io/FileNotFoundException; {:try_start_14 .. :try_end_14} :catch_1
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_2
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_14} :catch_4
    .catchall {:try_start_14 .. :try_end_14} :catchall_7

    .line 515
    const/16 v16, 0x0

    .line 517
    .local v16, "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    :try_start_15
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->getInputStream(Ljava/net/URLConnection;)Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    invoke-static {v10}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(Ljava/net/URLConnection;)Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;

    move-result-object v16

    .line 518
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v40, v0

    monitor-enter v40
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_6

    .line 519
    :try_start_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->aborted:Z

    move/from16 v39, v0

    if-eqz v39, :cond_18

    .line 520
    monitor-exit v40
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_8

    .line 534
    :try_start_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v40, v0

    monitor-enter v40
    :try_end_17
    .catch Ljava/io/FileNotFoundException; {:try_start_17 .. :try_end_17} :catch_1
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_2
    .catch Lorg/json/JSONException; {:try_start_17 .. :try_end_17} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_17 .. :try_end_17} :catch_4
    .catchall {:try_start_17 .. :try_end_17} :catchall_7

    .line 535
    :try_start_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    const/16 v41, 0x0

    move-object/from16 v0, v41

    move-object/from16 v1, v39

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 536
    monitor-exit v40
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_4

    .line 537
    :try_start_19
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v16 .. v16}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/io/Closeable;)V
    :try_end_19
    .catch Ljava/io/FileNotFoundException; {:try_start_19 .. :try_end_19} :catch_1
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_2
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_19} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_19} :catch_4
    .catchall {:try_start_19 .. :try_end_19} :catchall_7

    .line 566
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v40

    monitor-enter v40

    .line 567
    :try_start_1a
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$objectId:Ljava/lang/String;

    move-object/from16 v41, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    monitor-exit v40
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_5

    .line 570
    if-eqz v10, :cond_0

    .line 572
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object v15, v10

    .line 573
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 574
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 575
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 507
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .end local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .end local v28    # "responseCode":I
    :catchall_3
    move-exception v39

    :try_start_1b
    monitor-exit v40
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_3

    :try_start_1c
    throw v39
    :try_end_1c
    .catch Ljava/io/FileNotFoundException; {:try_start_1c .. :try_end_1c} :catch_1
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_2
    .catch Lorg/json/JSONException; {:try_start_1c .. :try_end_1c} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_4
    .catchall {:try_start_1c .. :try_end_1c} :catchall_7

    .line 557
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v6    # "buffer":[B
    .end local v7    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v24    # "prevBytesRead":J
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v33    # "stringLength":I
    .end local v35    # "tailParamsBytes":[B
    .end local v38    # "useChunkedMode":Z
    :catch_3
    move-exception v12

    .line 558
    .local v12, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v39, "FileTransfer"

    invoke-virtual {v12}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-static {v0, v1, v12}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 559
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    new-instance v40, Lorg/apache/cordova/PluginResult;

    sget-object v41, Lorg/apache/cordova/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v40 .. v41}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual/range {v39 .. v40}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_7

    .line 566
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v40

    monitor-enter v40

    .line 567
    :try_start_1e
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$objectId:Ljava/lang/String;

    move-object/from16 v41, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    monitor-exit v40
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_e

    .line 570
    if-eqz v10, :cond_0

    .line 572
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object v15, v10

    .line 573
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 574
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 575
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 536
    .end local v12    # "e":Lorg/json/JSONException;
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v6    # "buffer":[B
    .restart local v7    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v24    # "prevBytesRead":J
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v28    # "responseCode":I
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v33    # "stringLength":I
    .restart local v35    # "tailParamsBytes":[B
    .restart local v38    # "useChunkedMode":Z
    :catchall_4
    move-exception v39

    :try_start_1f
    monitor-exit v40
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_4

    :try_start_20
    throw v39
    :try_end_20
    .catch Ljava/io/FileNotFoundException; {:try_start_20 .. :try_end_20} :catch_1
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_20} :catch_2
    .catch Lorg/json/JSONException; {:try_start_20 .. :try_end_20} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_4
    .catchall {:try_start_20 .. :try_end_20} :catchall_7

    .line 560
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v6    # "buffer":[B
    .end local v7    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v24    # "prevBytesRead":J
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v28    # "responseCode":I
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v33    # "stringLength":I
    .end local v35    # "tailParamsBytes":[B
    .end local v38    # "useChunkedMode":Z
    :catch_4
    move-exception v34

    .line 562
    .local v34, "t":Ljava/lang/Throwable;
    :try_start_21
    sget v39, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$source:Ljava/lang/String;

    move-object/from16 v40, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$target:Ljava/lang/String;

    move-object/from16 v41, v0

    move/from16 v0, v39

    move-object/from16 v1, v40

    move-object/from16 v2, v41

    move-object/from16 v3, v34

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;Ljava/lang/Throwable;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v10, v3}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v13

    .line 563
    .restart local v13    # "error":Lorg/json/JSONObject;
    const-string v39, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    move-object/from16 v2, v34

    invoke-static {v0, v1, v2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 564
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    new-instance v40, Lorg/apache/cordova/PluginResult;

    sget-object v41, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v40

    move-object/from16 v1, v41

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual/range {v39 .. v40}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_7

    .line 566
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v40

    monitor-enter v40

    .line 567
    :try_start_22
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$objectId:Ljava/lang/String;

    move-object/from16 v41, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    monitor-exit v40
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_f

    .line 570
    if-eqz v10, :cond_0

    .line 572
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object v15, v10

    .line 573
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 574
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 575
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 568
    .end local v13    # "error":Lorg/json/JSONObject;
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .end local v34    # "t":Ljava/lang/Throwable;
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v6    # "buffer":[B
    .restart local v7    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v24    # "prevBytesRead":J
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v28    # "responseCode":I
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v33    # "stringLength":I
    .restart local v35    # "tailParamsBytes":[B
    .restart local v38    # "useChunkedMode":Z
    :catchall_5
    move-exception v39

    :try_start_23
    monitor-exit v40
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_5

    throw v39

    .line 522
    :cond_18
    :try_start_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    iput-object v10, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 523
    monitor-exit v40
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_8

    .line 525
    :try_start_25
    new-instance v22, Ljava/io/ByteArrayOutputStream;

    const/16 v39, 0x400

    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v40

    invoke-static/range {v39 .. v40}, Ljava/lang/Math;->max(II)I

    move-result v39

    move-object/from16 v0, v22

    move/from16 v1, v39

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 526
    .local v22, "out":Ljava/io/ByteArrayOutputStream;
    const/16 v39, 0x400

    move/from16 v0, v39

    new-array v6, v0, [B

    .line 527
    const/4 v9, 0x0

    .line 529
    :goto_8
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;->read([B)I

    move-result v9

    if-lez v9, :cond_1a

    .line 530
    const/16 v39, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v39

    invoke-virtual {v0, v6, v1, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_6

    goto :goto_8

    .line 534
    .end local v22    # "out":Ljava/io/ByteArrayOutputStream;
    :catchall_6
    move-exception v39

    :try_start_26
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v40, v0

    monitor-enter v40
    :try_end_26
    .catch Ljava/io/FileNotFoundException; {:try_start_26 .. :try_end_26} :catch_1
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_26} :catch_2
    .catch Lorg/json/JSONException; {:try_start_26 .. :try_end_26} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_4
    .catchall {:try_start_26 .. :try_end_26} :catchall_7

    .line 535
    :try_start_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v41, v0

    const/16 v42, 0x0

    move-object/from16 v0, v42

    move-object/from16 v1, v41

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 536
    monitor-exit v40
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_a

    .line 537
    :try_start_28
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v16 .. v16}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/io/Closeable;)V

    throw v39
    :try_end_28
    .catch Ljava/io/FileNotFoundException; {:try_start_28 .. :try_end_28} :catch_1
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_28} :catch_2
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_28} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_4
    .catchall {:try_start_28 .. :try_end_28} :catchall_7

    .line 566
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v6    # "buffer":[B
    .end local v7    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v24    # "prevBytesRead":J
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v28    # "responseCode":I
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v33    # "stringLength":I
    .end local v35    # "tailParamsBytes":[B
    .end local v38    # "useChunkedMode":Z
    :catchall_7
    move-exception v39

    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v40

    monitor-enter v40

    .line 567
    :try_start_29
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v41

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$objectId:Ljava/lang/String;

    move-object/from16 v42, v0

    invoke-virtual/range {v41 .. v42}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    monitor-exit v40
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_10

    .line 570
    if-eqz v10, :cond_19

    .line 572
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    move/from16 v40, v0

    if-eqz v40, :cond_19

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v40, v0

    if-eqz v40, :cond_19

    move-object v15, v10

    .line 573
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 574
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 575
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 576
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_19
    throw v39

    .line 523
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v6    # "buffer":[B
    .restart local v7    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v24    # "prevBytesRead":J
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v28    # "responseCode":I
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v33    # "stringLength":I
    .restart local v35    # "tailParamsBytes":[B
    .restart local v38    # "useChunkedMode":Z
    :catchall_8
    move-exception v39

    :try_start_2a
    monitor-exit v40
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_8

    :try_start_2b
    throw v39

    .line 532
    .restart local v22    # "out":Ljava/io/ByteArrayOutputStream;
    :cond_1a
    const-string v39, "UTF-8"

    move-object/from16 v0, v22

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_6

    move-result-object v29

    .line 534
    .local v29, "responseString":Ljava/lang/String;
    :try_start_2c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v40, v0

    monitor-enter v40
    :try_end_2c
    .catch Ljava/io/FileNotFoundException; {:try_start_2c .. :try_end_2c} :catch_1
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2c} :catch_2
    .catch Lorg/json/JSONException; {:try_start_2c .. :try_end_2c} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_2c} :catch_4
    .catchall {:try_start_2c .. :try_end_2c} :catchall_7

    .line 535
    :try_start_2d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    const/16 v41, 0x0

    move-object/from16 v0, v41

    move-object/from16 v1, v39

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 536
    monitor-exit v40
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_9

    .line 537
    :try_start_2e
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v16 .. v16}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/io/Closeable;)V

    .line 540
    const-string v39, "FileTransfer"

    const-string v40, "got response from server"

    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 541
    const-string v39, "FileTransfer"

    const/16 v40, 0x0

    const/16 v41, 0x100

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v42

    invoke-static/range {v41 .. v42}, Ljava/lang/Math;->min(II)I

    move-result v41

    move-object/from16 v0, v29

    move/from16 v1, v40

    move/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    move-object/from16 v0, v30

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileUploadResult;->setResponseCode(I)V

    .line 545
    move-object/from16 v0, v30

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileUploadResult;->setResponse(Ljava/lang/String;)V

    .line 547
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    new-instance v40, Lorg/apache/cordova/PluginResult;

    sget-object v41, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v30 .. v30}, Lorg/apache/cordova/filetransfer/FileUploadResult;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v42

    invoke-direct/range {v40 .. v42}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual/range {v39 .. v40}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_2e
    .catch Ljava/io/FileNotFoundException; {:try_start_2e .. :try_end_2e} :catch_1
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_2e} :catch_2
    .catch Lorg/json/JSONException; {:try_start_2e .. :try_end_2e} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_2e} :catch_4
    .catchall {:try_start_2e .. :try_end_2e} :catchall_7

    .line 566
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v40

    monitor-enter v40

    .line 567
    :try_start_2f
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700()Ljava/util/HashMap;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$objectId:Ljava/lang/String;

    move-object/from16 v41, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    monitor-exit v40
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_b

    .line 570
    if-eqz v10, :cond_0

    .line 572
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$trustEveryone:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$1;->val$useHttps:Z

    move/from16 v39, v0

    if-eqz v39, :cond_0

    move-object v15, v10

    .line 573
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 574
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 575
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 536
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :catchall_9
    move-exception v39

    :try_start_30
    monitor-exit v40
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_9

    :try_start_31
    throw v39
    :try_end_31
    .catch Ljava/io/FileNotFoundException; {:try_start_31 .. :try_end_31} :catch_1
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_31} :catch_2
    .catch Lorg/json/JSONException; {:try_start_31 .. :try_end_31} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_31 .. :try_end_31} :catch_4
    .catchall {:try_start_31 .. :try_end_31} :catchall_7

    .end local v22    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v29    # "responseString":Ljava/lang/String;
    :catchall_a
    move-exception v39

    :try_start_32
    monitor-exit v40
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_a

    :try_start_33
    throw v39
    :try_end_33
    .catch Ljava/io/FileNotFoundException; {:try_start_33 .. :try_end_33} :catch_1
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_33} :catch_2
    .catch Lorg/json/JSONException; {:try_start_33 .. :try_end_33} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_33 .. :try_end_33} :catch_4
    .catchall {:try_start_33 .. :try_end_33} :catchall_7

    .line 568
    .restart local v22    # "out":Ljava/io/ByteArrayOutputStream;
    .restart local v29    # "responseString":Ljava/lang/String;
    :catchall_b
    move-exception v39

    :try_start_34
    monitor-exit v40
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_b

    throw v39

    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v6    # "buffer":[B
    .end local v7    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .end local v19    # "multipartFormUpload":Z
    .end local v22    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v24    # "prevBytesRead":J
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v28    # "responseCode":I
    .end local v29    # "responseString":Ljava/lang/String;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v33    # "stringLength":I
    .end local v35    # "tailParamsBytes":[B
    .end local v38    # "useChunkedMode":Z
    .local v12, "e":Ljava/io/FileNotFoundException;
    .restart local v13    # "error":Lorg/json/JSONObject;
    :catchall_c
    move-exception v39

    :try_start_35
    monitor-exit v40
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_c

    throw v39

    .local v12, "e":Ljava/io/IOException;
    :catchall_d
    move-exception v39

    :try_start_36
    monitor-exit v40
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_d

    throw v39

    .end local v13    # "error":Lorg/json/JSONObject;
    .local v12, "e":Lorg/json/JSONException;
    :catchall_e
    move-exception v39

    :try_start_37
    monitor-exit v40
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_e

    throw v39

    .end local v12    # "e":Lorg/json/JSONException;
    .restart local v13    # "error":Lorg/json/JSONObject;
    .restart local v34    # "t":Ljava/lang/Throwable;
    :catchall_f
    move-exception v39

    :try_start_38
    monitor-exit v40
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_f

    throw v39

    .end local v13    # "error":Lorg/json/JSONObject;
    .end local v34    # "t":Ljava/lang/Throwable;
    :catchall_10
    move-exception v39

    :try_start_39
    monitor-exit v40
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_10

    throw v39
.end method
