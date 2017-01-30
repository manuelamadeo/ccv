.class public Lorg/apache/cordova/mediacapture/PendingRequests;
.super Ljava/lang/Object;
.source "PendingRequests.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    }
.end annotation


# static fields
.field private static final CURRENT_ID_KEY:Ljava/lang/String; = "currentReqId"

.field private static final LOG_TAG:Ljava/lang/String; = "PendingCaptureRequests"

.field private static final REQUEST_KEY_PREFIX:Ljava/lang/String; = "request_"


# instance fields
.field private currentReqId:I

.field private lastSavedState:Landroid/os/Bundle;

.field private requests:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lorg/apache/cordova/mediacapture/PendingRequests$Request;",
            ">;"
        }
    .end annotation
.end field

.field private resumeContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->currentReqId:I

    .line 42
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    return-void
.end method

.method static synthetic access$400(Lorg/apache/cordova/mediacapture/PendingRequests;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/mediacapture/PendingRequests;

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/apache/cordova/mediacapture/PendingRequests;->incrementCurrentReqId()I

    move-result v0

    return v0
.end method

.method private declared-synchronized incrementCurrentReqId()I
    .locals 2

    .prologue
    .line 113
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->currentReqId:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->currentReqId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized createRequest(ILorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    .locals 6
    .param p1, "action"    # I
    .param p2, "options"    # Lorg/json/JSONObject;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 57
    monitor-enter p0

    :try_start_0
    new-instance v0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/cordova/mediacapture/PendingRequests$Request;-><init>(Lorg/apache/cordova/mediacapture/PendingRequests;ILorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;Lorg/apache/cordova/mediacapture/PendingRequests$1;)V

    .line 58
    .local v0, "req":Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    iget v2, v0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    monitor-exit p0

    return-object v0

    .line 57
    .end local v0    # "req":Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized get(I)Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    .locals 6
    .param p1, "requestCode"    # I

    .prologue
    .line 70
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->lastSavedState:Landroid/os/Bundle;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->lastSavedState:Landroid/os/Bundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "request_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 71
    new-instance v0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    iget-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->lastSavedState:Landroid/os/Bundle;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "request_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->resumeContext:Lorg/apache/cordova/CallbackContext;

    const/4 v5, 0x0

    move-object v1, p0

    move v4, p1

    invoke-direct/range {v0 .. v5}, Lorg/apache/cordova/mediacapture/PendingRequests$Request;-><init>(Lorg/apache/cordova/mediacapture/PendingRequests;Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;ILorg/apache/cordova/mediacapture/PendingRequests$1;)V

    .line 72
    .local v0, "r":Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 76
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->lastSavedState:Landroid/os/Bundle;

    .line 77
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->resumeContext:Lorg/apache/cordova/CallbackContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .end local v0    # "r":Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v1

    goto :goto_0

    .line 70
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized resolveWithFailure(Lorg/apache/cordova/mediacapture/PendingRequests$Request;Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "req"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    .param p2, "error"    # Lorg/json/JSONObject;

    .prologue
    .line 92
    monitor-enter p0

    :try_start_0
    # getter for: Lorg/apache/cordova/mediacapture/PendingRequests$Request;->callbackContext:Lorg/apache/cordova/CallbackContext;
    invoke-static {p1}, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->access$200(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    .line 93
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    iget v1, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    monitor-exit p0

    return-void

    .line 92
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized resolveWithSuccess(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V
    .locals 4
    .param p1, "req"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    .prologue
    .line 102
    monitor-enter p0

    :try_start_0
    # getter for: Lorg/apache/cordova/mediacapture/PendingRequests$Request;->callbackContext:Lorg/apache/cordova/CallbackContext;
    invoke-static {p1}, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->access$200(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v3, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 103
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    iget v1, p1, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    monitor-exit p0

    return-void

    .line 102
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setLastSavedState(Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p1, "lastSavedState"    # Landroid/os/Bundle;
    .param p2, "resumeContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 124
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->lastSavedState:Landroid/os/Bundle;

    .line 125
    iput-object p2, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->resumeContext:Lorg/apache/cordova/CallbackContext;

    .line 126
    const-string v0, "currentReqId"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->currentReqId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    monitor-exit p0

    return-void

    .line 124
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toBundle()Landroid/os/Bundle;
    .locals 6

    .prologue
    .line 135
    monitor-enter p0

    :try_start_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 136
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v4, "currentReqId"

    iget v5, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->currentReqId:I

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 138
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 139
    iget-object v4, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    .line 140
    .local v2, "r":Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    iget-object v4, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    .line 141
    .local v3, "requestCode":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "request_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    # invokes: Lorg/apache/cordova/mediacapture/PendingRequests$Request;->toBundle()Landroid/os/Bundle;
    invoke-static {v2}, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->access$300(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 144
    .end local v2    # "r":Lorg/apache/cordova/mediacapture/PendingRequests$Request;
    .end local v3    # "requestCode":I
    :cond_0
    iget-object v4, p0, Lorg/apache/cordova/mediacapture/PendingRequests;->requests:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_1

    .line 148
    const-string v4, "PendingCaptureRequests"

    const-string v5, "More than one media capture request pending on Activity destruction. Some requests will be dropped!"

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    :cond_1
    monitor-exit p0

    return-object v0

    .line 135
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "i":I
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method
