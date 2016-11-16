.class public Lorg/apache/cordova/mediacapture/PendingRequests$Request;
.super Ljava/lang/Object;
.source "PendingRequests.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/mediacapture/PendingRequests;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Request"
.end annotation


# static fields
.field private static final ACTION_KEY:Ljava/lang/String; = "action"

.field private static final DURATION_KEY:Ljava/lang/String; = "duration"

.field private static final LIMIT_KEY:Ljava/lang/String; = "limit"

.field private static final QUALITY_KEY:Ljava/lang/String; = "quality"

.field private static final RESULTS_KEY:Ljava/lang/String; = "results"


# instance fields
.field public action:I

.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field public duration:I

.field public limit:J

.field public quality:I

.field public requestCode:I

.field public results:Lorg/json/JSONArray;

.field final synthetic this$0:Lorg/apache/cordova/mediacapture/PendingRequests;


# direct methods
.method private constructor <init>(Lorg/apache/cordova/mediacapture/PendingRequests;ILorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 6
    .param p1, "this$0"    # Lorg/apache/cordova/mediacapture/PendingRequests;
    .param p2, "action"    # I
    .param p3, "options"    # Lorg/json/JSONObject;
    .param p4, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x1

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 187
    iput-object p1, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->this$0:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    iput-wide v4, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->limit:J

    .line 176
    iput v2, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->duration:I

    .line 179
    iput v3, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->quality:I

    .line 182
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    .line 188
    iput-object p4, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 189
    iput p2, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->action:I

    .line 191
    if-eqz p3, :cond_0

    .line 192
    const-string v0, "limit"

    invoke-virtual {p3, v0, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->limit:J

    .line 193
    const-string v0, "duration"

    invoke-virtual {p3, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->duration:I

    .line 194
    const-string v0, "quality"

    invoke-virtual {p3, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->quality:I

    .line 197
    :cond_0
    # invokes: Lorg/apache/cordova/mediacapture/PendingRequests;->incrementCurrentReqId()I
    invoke-static {p1}, Lorg/apache/cordova/mediacapture/PendingRequests;->access$400(Lorg/apache/cordova/mediacapture/PendingRequests;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    .line 198
    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/cordova/mediacapture/PendingRequests;ILorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;Lorg/apache/cordova/mediacapture/PendingRequests$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/cordova/mediacapture/PendingRequests;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lorg/json/JSONObject;
    .param p4, "x3"    # Lorg/apache/cordova/CallbackContext;
    .param p5, "x4"    # Lorg/apache/cordova/mediacapture/PendingRequests$1;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 157
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/cordova/mediacapture/PendingRequests$Request;-><init>(Lorg/apache/cordova/mediacapture/PendingRequests;ILorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method private constructor <init>(Lorg/apache/cordova/mediacapture/PendingRequests;Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;I)V
    .locals 4
    .param p1, "this$0"    # Lorg/apache/cordova/mediacapture/PendingRequests;
    .param p2, "bundle"    # Landroid/os/Bundle;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p4, "requestCode"    # I

    .prologue
    .line 200
    iput-object p1, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->this$0:Lorg/apache/cordova/mediacapture/PendingRequests;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    const-wide/16 v2, 0x1

    iput-wide v2, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->limit:J

    .line 176
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->duration:I

    .line 179
    const/4 v1, 0x1

    iput v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->quality:I

    .line 182
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    .line 201
    iput-object p3, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 202
    iput p4, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->requestCode:I

    .line 203
    const-string v1, "action"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->action:I

    .line 204
    const-string v1, "limit"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->limit:J

    .line 205
    const-string v1, "duration"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->duration:I

    .line 206
    const-string v1, "quality"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->quality:I

    .line 209
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    const-string v2, "results"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    :goto_0
    return-void

    .line 210
    :catch_0
    move-exception v0

    .line 212
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "PendingCaptureRequests"

    const-string v2, "Error parsing results for request from saved bundle"

    invoke-static {v1, v2, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method synthetic constructor <init>(Lorg/apache/cordova/mediacapture/PendingRequests;Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;ILorg/apache/cordova/mediacapture/PendingRequests$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/cordova/mediacapture/PendingRequests;
    .param p2, "x1"    # Landroid/os/Bundle;
    .param p3, "x2"    # Lorg/apache/cordova/CallbackContext;
    .param p4, "x3"    # I
    .param p5, "x4"    # Lorg/apache/cordova/mediacapture/PendingRequests$1;

    .prologue
    .line 157
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/cordova/mediacapture/PendingRequests$Request;-><init>(Lorg/apache/cordova/mediacapture/PendingRequests;Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;I)V

    return-void
.end method

.method static synthetic access$200(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)Lorg/apache/cordova/CallbackContext;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    .prologue
    .line 157
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->callbackContext:Lorg/apache/cordova/CallbackContext;

    return-object v0
.end method

.method static synthetic access$300(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    .prologue
    .line 157
    invoke-direct {p0}, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method private toBundle()Landroid/os/Bundle;
    .locals 4

    .prologue
    .line 217
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 219
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "action"

    iget v2, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->action:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 220
    const-string v1, "limit"

    iget-wide v2, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->limit:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 221
    const-string v1, "duration"

    iget v2, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->duration:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 222
    const-string v1, "quality"

    iget v2, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->quality:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 223
    const-string v1, "results"

    iget-object v2, p0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->results:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    return-object v0
.end method
