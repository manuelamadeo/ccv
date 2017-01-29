.class public Lorg/apache/cordova/media/AudioHandler;
.super Lorg/apache/cordova/CordovaPlugin;
.source "AudioHandler.java"


# static fields
.field public static final PERMISSION_DENIED_ERROR:I = 0x14

.field public static RECORD_AUDIO:I

.field public static TAG:Ljava/lang/String;

.field public static WRITE_EXTERNAL_STORAGE:I

.field public static permissions:[Ljava/lang/String;


# instance fields
.field private fileUriStr:Ljava/lang/String;

.field private focusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field private messageChannel:Lorg/apache/cordova/CallbackContext;

.field private origVolumeStream:I

.field pausedForFocus:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/cordova/media/AudioPlayer;",
            ">;"
        }
    .end annotation
.end field

.field pausedForPhone:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/cordova/media/AudioPlayer;",
            ">;"
        }
    .end annotation
.end field

.field players:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/media/AudioPlayer;",
            ">;"
        }
    .end annotation
.end field

.field private recordId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 58
    const-string v0, "AudioHandler"

    sput-object v0, Lorg/apache/cordova/media/AudioHandler;->TAG:Ljava/lang/String;

    .line 66
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "android.permission.RECORD_AUDIO"

    aput-object v1, v0, v2

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v1, v0, v3

    sput-object v0, Lorg/apache/cordova/media/AudioHandler;->permissions:[Ljava/lang/String;

    .line 67
    sput v2, Lorg/apache/cordova/media/AudioHandler;->RECORD_AUDIO:I

    .line 68
    sput v3, Lorg/apache/cordova/media/AudioHandler;->WRITE_EXTERNAL_STORAGE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    .line 422
    new-instance v0, Lorg/apache/cordova/media/AudioHandler$1;

    invoke-direct {v0, p0}, Lorg/apache/cordova/media/AudioHandler$1;-><init>(Lorg/apache/cordova/media/AudioHandler;)V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->focusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForFocus:Ljava/util/ArrayList;

    .line 82
    return-void
.end method

.method private getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 253
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 254
    .local v0, "ret":Lorg/apache/cordova/media/AudioPlayer;
    if-nez v0, :cond_1

    .line 255
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 256
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioHandler;->onFirstPlayerCreated()V

    .line 258
    :cond_0
    new-instance v0, Lorg/apache/cordova/media/AudioPlayer;

    .end local v0    # "ret":Lorg/apache/cordova/media/AudioPlayer;
    invoke-direct {v0, p0, p1, p2}, Lorg/apache/cordova/media/AudioPlayer;-><init>(Lorg/apache/cordova/media/AudioHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    .restart local v0    # "ret":Lorg/apache/cordova/media/AudioPlayer;
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    :cond_1
    return-object v0
.end method

.method private onFirstPlayerCreated()V
    .locals 2

    .prologue
    .line 491
    iget-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getVolumeControlStream()I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    .line 492
    iget-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 493
    return-void
.end method

.method private onLastPlayerReleased()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 496
    iget v0, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    if-eq v0, v2, :cond_0

    .line 497
    iget-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget v1, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 498
    iput v2, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    .line 500
    :cond_0
    return-void
.end method

.method private promptForRecord()V
    .locals 2

    .prologue
    .line 541
    sget-object v0, Lorg/apache/cordova/media/AudioHandler;->permissions:[Ljava/lang/String;

    sget v1, Lorg/apache/cordova/media/AudioHandler;->WRITE_EXTERNAL_STORAGE:I

    aget-object v0, v0, v1

    invoke-static {p0, v0}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lorg/apache/cordova/media/AudioHandler;->permissions:[Ljava/lang/String;

    sget v1, Lorg/apache/cordova/media/AudioHandler;->RECORD_AUDIO:I

    aget-object v0, v0, v1

    .line 542
    invoke-static {p0, v0}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 543
    iget-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->recordId:Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->fileUriStr:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/cordova/media/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/media/AudioHandler;->startRecordingAudio(Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    :goto_0
    return-void

    .line 545
    :cond_0
    sget-object v0, Lorg/apache/cordova/media/AudioHandler;->permissions:[Ljava/lang/String;

    sget v1, Lorg/apache/cordova/media/AudioHandler;->RECORD_AUDIO:I

    aget-object v0, v0, v1

    invoke-static {p0, v0}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 547
    sget v0, Lorg/apache/cordova/media/AudioHandler;->WRITE_EXTERNAL_STORAGE:I

    invoke-virtual {p0, v0}, Lorg/apache/cordova/media/AudioHandler;->getWritePermission(I)V

    goto :goto_0

    .line 551
    :cond_1
    sget v0, Lorg/apache/cordova/media/AudioHandler;->RECORD_AUDIO:I

    invoke-virtual {p0, v0}, Lorg/apache/cordova/media/AudioHandler;->getMicPermission(I)V

    goto :goto_0
.end method

.method private release(Ljava/lang/String;)Z
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 269
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 270
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-nez v0, :cond_0

    .line 271
    const/4 v1, 0x0

    .line 277
    :goto_0
    return v1

    .line 273
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 274
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioHandler;->onLastPlayerReleased()V

    .line 276
    :cond_1
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->destroy()V

    .line 277
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 14
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 105
    iget-object v12, p0, Lorg/apache/cordova/media/AudioHandler;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v12}, Lorg/apache/cordova/CordovaWebView;->getResourceApi()Lorg/apache/cordova/CordovaResourceApi;

    move-result-object v6

    .line 106
    .local v6, "resourceApi":Lorg/apache/cordova/CordovaResourceApi;
    sget-object v9, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    .line 107
    .local v9, "status":Lorg/apache/cordova/PluginResult$Status;
    const-string v7, ""

    .line 109
    .local v7, "result":Ljava/lang/String;
    const-string v12, "startRecordingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 110
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lorg/apache/cordova/media/AudioHandler;->recordId:Ljava/lang/String;

    .line 111
    const/4 v12, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 113
    .local v10, "target":Ljava/lang/String;
    :try_start_0
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-virtual {v6, v12}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v11

    .line 114
    .local v11, "targetUri":Landroid/net/Uri;
    invoke-virtual {v11}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lorg/apache/cordova/media/AudioHandler;->fileUriStr:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .end local v11    # "targetUri":Landroid/net/Uri;
    :goto_0
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioHandler;->promptForRecord()V

    .line 186
    .end local v10    # "target":Ljava/lang/String;
    :goto_1
    new-instance v12, Lorg/apache/cordova/PluginResult;

    invoke-direct {v12, v9, v7}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 188
    const/4 v12, 0x1

    :goto_2
    return v12

    .line 115
    .restart local v10    # "target":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 116
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    iput-object v10, p0, Lorg/apache/cordova/media/AudioHandler;->fileUriStr:Ljava/lang/String;

    goto :goto_0

    .line 120
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    .end local v10    # "target":Ljava/lang/String;
    :cond_0
    const-string v12, "stopRecordingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 121
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->stopRecordingAudio(Ljava/lang/String;Z)V

    goto :goto_1

    .line 123
    :cond_1
    const-string v12, "pauseRecordingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 124
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->stopRecordingAudio(Ljava/lang/String;Z)V

    goto :goto_1

    .line 126
    :cond_2
    const-string v12, "resumeRecordingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 127
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->resumeRecordingAudio(Ljava/lang/String;)V

    goto :goto_1

    .line 129
    :cond_3
    const-string v12, "startPlayingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 130
    const/4 v12, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 133
    .restart local v10    # "target":Ljava/lang/String;
    :try_start_1
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-virtual {v6, v12}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v11

    .line 134
    .restart local v11    # "targetUri":Landroid/net/Uri;
    invoke-virtual {v11}, Landroid/net/Uri;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 138
    .end local v11    # "targetUri":Landroid/net/Uri;
    .local v4, "fileUriStr":Ljava/lang/String;
    :goto_3
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v4}, Lorg/apache/cordova/media/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->startPlayingAudio(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 135
    .end local v4    # "fileUriStr":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 136
    .restart local v2    # "e":Ljava/lang/IllegalArgumentException;
    move-object v4, v10

    .restart local v4    # "fileUriStr":Ljava/lang/String;
    goto :goto_3

    .line 140
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    .end local v4    # "fileUriStr":Ljava/lang/String;
    .end local v10    # "target":Ljava/lang/String;
    :cond_4
    const-string v12, "seekToAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 141
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getInt(I)I

    move-result v13

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->seekToAudio(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 143
    :cond_5
    const-string v12, "pausePlayingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 144
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->pausePlayingAudio(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 146
    :cond_6
    const-string v12, "stopPlayingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 147
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->stopPlayingAudio(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 148
    :cond_7
    const-string v12, "setVolume"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 150
    const/4 v12, 0x0

    :try_start_2
    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v13

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->setVolume(Ljava/lang/String;F)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1

    .line 151
    :catch_2
    move-exception v12

    goto/16 :goto_1

    .line 154
    :cond_8
    const-string v12, "getCurrentPositionAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 155
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->getCurrentPositionAudio(Ljava/lang/String;)F

    move-result v3

    .line 156
    .local v3, "f":F
    new-instance v12, Lorg/apache/cordova/PluginResult;

    invoke-direct {v12, v9, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 157
    const/4 v12, 0x1

    goto/16 :goto_2

    .line 159
    .end local v3    # "f":F
    :cond_9
    const-string v12, "getDurationAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 160
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->getDurationAudio(Ljava/lang/String;Ljava/lang/String;)F

    move-result v3

    .line 161
    .restart local v3    # "f":F
    new-instance v12, Lorg/apache/cordova/PluginResult;

    invoke-direct {v12, v9, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 162
    const/4 v12, 0x1

    goto/16 :goto_2

    .line 164
    .end local v3    # "f":F
    :cond_a
    const-string v12, "create"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 165
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 166
    .local v5, "id":Ljava/lang/String;
    const/4 v12, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/apache/cordova/media/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 167
    .local v8, "src":Ljava/lang/String;
    invoke-direct {p0, v5, v8}, Lorg/apache/cordova/media/AudioHandler;->getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;

    goto/16 :goto_1

    .line 169
    .end local v5    # "id":Ljava/lang/String;
    .end local v8    # "src":Ljava/lang/String;
    :cond_b
    const-string v12, "release"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c

    .line 170
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->release(Ljava/lang/String;)Z

    move-result v1

    .line 171
    .local v1, "b":Z
    new-instance v12, Lorg/apache/cordova/PluginResult;

    invoke-direct {v12, v9, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 172
    const/4 v12, 0x1

    goto/16 :goto_2

    .line 174
    .end local v1    # "b":Z
    :cond_c
    const-string v12, "messageChannel"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_d

    .line 175
    move-object/from16 v0, p3

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->messageChannel:Lorg/apache/cordova/CallbackContext;

    .line 176
    const/4 v12, 0x1

    goto/16 :goto_2

    .line 177
    :cond_d
    const-string v12, "getCurrentAmplitudeAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_e

    .line 178
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->getCurrentAmplitudeAudio(Ljava/lang/String;)F

    move-result v3

    .line 179
    .restart local v3    # "f":F
    new-instance v12, Lorg/apache/cordova/PluginResult;

    invoke-direct {v12, v9, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 180
    const/4 v12, 0x1

    goto/16 :goto_2

    .line 183
    .end local v3    # "f":F
    :cond_e
    const/4 v12, 0x0

    goto/16 :goto_2
.end method

.method public getAudioFocus()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 440
    const-string v0, "AudioHandler.getAudioFocus(): Error : "

    .line 442
    .local v0, "TAG2":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "audio"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    .line 443
    .local v1, "am":Landroid/media/AudioManager;
    iget-object v3, p0, Lorg/apache/cordova/media/AudioHandler;->focusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    const/4 v4, 0x3

    invoke-virtual {v1, v3, v4, v5}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v2

    .line 447
    .local v2, "result":I
    if-eq v2, v5, :cond_0

    .line 448
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " instead of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 451
    :cond_0
    return-void
.end method

.method public getAudioOutputDevice()I
    .locals 6

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 461
    iget-object v3, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "audio"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 462
    .local v0, "audiMgr":Landroid/media/AudioManager;
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->getRouting(I)I

    move-result v3

    if-ne v3, v1, :cond_0

    .line 469
    :goto_0
    return v1

    .line 465
    :cond_0
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->getRouting(I)I

    move-result v1

    if-ne v1, v2, :cond_1

    move v1, v2

    .line 466
    goto :goto_0

    .line 469
    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getCurrentAmplitudeAudio(Ljava/lang/String;)F
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 562
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 563
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 564
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->getCurrentAmplitude()F

    move-result v1

    .line 566
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getCurrentPositionAudio(Ljava/lang/String;)F
    .locals 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 364
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 365
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 366
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->getCurrentPosition()J

    move-result-wide v2

    long-to-float v1, v2

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr v1, v2

    .line 368
    :goto_0
    return v1

    :cond_0
    const/high16 v1, -0x40800000    # -1.0f

    goto :goto_0
.end method

.method public getDurationAudio(Ljava/lang/String;Ljava/lang/String;)F
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 378
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/media/AudioHandler;->getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;

    move-result-object v0

    .line 379
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->getDuration(Ljava/lang/String;)F

    move-result v1

    return v1
.end method

.method protected getMicPermission(I)V
    .locals 2
    .param p1, "requestCode"    # I

    .prologue
    .line 93
    sget-object v0, Lorg/apache/cordova/media/AudioHandler;->permissions:[Ljava/lang/String;

    sget v1, Lorg/apache/cordova/media/AudioHandler;->RECORD_AUDIO:I

    aget-object v0, v0, v1

    invoke-static {p0, p1, v0}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    .line 94
    return-void
.end method

.method protected getWritePermission(I)V
    .locals 2
    .param p1, "requestCode"    # I

    .prologue
    .line 87
    sget-object v0, Lorg/apache/cordova/media/AudioHandler;->permissions:[Ljava/lang/String;

    sget v1, Lorg/apache/cordova/media/AudioHandler;->WRITE_EXTERNAL_STORAGE:I

    aget-object v0, v0, v1

    invoke-static {p0, p1, v0}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    .line 88
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 195
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 196
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioHandler;->onLastPlayerReleased()V

    .line 198
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 199
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->destroy()V

    goto :goto_0

    .line 201
    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    :cond_1
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 202
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 222
    const-string v1, "telephone"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 225
    const-string v1, "ringing"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "offhook"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 228
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 229
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->getState()I

    move-result v2

    sget-object v3, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v3}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 230
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 231
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->pausePlaying()V

    goto :goto_0

    .line 238
    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    :cond_2
    const-string v1, "idle"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 239
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 240
    .restart local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0, v4}, Lorg/apache/cordova/media/AudioPlayer;->startPlaying(Ljava/lang/String;)V

    goto :goto_1

    .line 242
    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    :cond_3
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 245
    :cond_4
    return-object v4
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 523
    array-length v2, p3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_1

    aget v0, p3, v1

    .line 525
    .local v0, "r":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 527
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->messageChannel:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const/16 v4, 0x14

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 532
    .end local v0    # "r":I
    :goto_1
    return-void

    .line 523
    .restart local v0    # "r":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 531
    .end local v0    # "r":I
    :cond_1
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioHandler;->promptForRecord()V

    goto :goto_1
.end method

.method public onReset()V
    .locals 0

    .prologue
    .line 209
    invoke-virtual {p0}, Lorg/apache/cordova/media/AudioHandler;->onDestroy()V

    .line 210
    return-void
.end method

.method public pauseAllLostFocus()V
    .locals 4

    .prologue
    .line 404
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 405
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->getState()I

    move-result v2

    sget-object v3, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v3}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 406
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForFocus:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 407
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->pausePlaying()V

    goto :goto_0

    .line 410
    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    :cond_1
    return-void
.end method

.method public pausePlayingAudio(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 341
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 342
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 343
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->pausePlaying()V

    .line 345
    :cond_0
    return-void
.end method

.method public resumeAllGainedFocus()V
    .locals 3

    .prologue
    .line 413
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForFocus:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 414
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/media/AudioPlayer;->startPlaying(Ljava/lang/String;)V

    goto :goto_0

    .line 416
    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForFocus:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 417
    return-void
.end method

.method public resumeRecordingAudio(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 307
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 308
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 309
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->resumeRecording()V

    .line 311
    :cond_0
    return-void
.end method

.method public seekToAudio(Ljava/lang/String;I)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "milliseconds"    # I

    .prologue
    .line 330
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 331
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 332
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->seekToPlaying(I)V

    .line 334
    :cond_0
    return-void
.end method

.method sendEventMessage(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "actionData"    # Lorg/json/JSONObject;

    .prologue
    .line 503
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 505
    .local v1, "message":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "action"

    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 506
    if-eqz p2, :cond_0

    .line 507
    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 513
    :cond_0
    :goto_0
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 514
    .local v2, "pluginResult":Lorg/apache/cordova/PluginResult;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 515
    iget-object v3, p0, Lorg/apache/cordova/media/AudioHandler;->messageChannel:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_1

    .line 516
    iget-object v3, p0, Lorg/apache/cordova/media/AudioHandler;->messageChannel:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 518
    :cond_1
    return-void

    .line 509
    .end local v2    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :catch_0
    move-exception v0

    .line 510
    .local v0, "e":Lorg/json/JSONException;
    sget-object v3, Lorg/apache/cordova/media/AudioHandler;->TAG:Ljava/lang/String;

    const-string v4, "Failed to create event message"

    invoke-static {v3, v4, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public setAudioOutputDevice(I)V
    .locals 8
    .param p1, "output"    # I

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 389
    const-string v0, "AudioHandler.setAudioOutputDevice(): Error : "

    .line 391
    .local v0, "TAG1":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "audio"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    .line 392
    .local v1, "audiMgr":Landroid/media/AudioManager;
    if-ne p1, v7, :cond_0

    .line 393
    invoke-virtual {v1, v5, v7, v4}, Landroid/media/AudioManager;->setRouting(III)V

    .line 401
    :goto_0
    return-void

    .line 395
    :cond_0
    if-ne p1, v6, :cond_1

    .line 396
    invoke-virtual {v1, v5, v6, v4}, Landroid/media/AudioManager;->setRouting(III)V

    goto :goto_0

    .line 399
    :cond_1
    const-string v2, " Unknown output device"

    invoke-static {v0, v2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setVolume(Ljava/lang/String;F)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "volume"    # F

    .prologue
    .line 480
    const-string v0, "AudioHandler.setVolume(): Error : "

    .line 482
    .local v0, "TAG3":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/media/AudioPlayer;

    .line 483
    .local v1, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v1, :cond_0

    .line 484
    invoke-virtual {v1, p2}, Lorg/apache/cordova/media/AudioPlayer;->setVolume(F)V

    .line 488
    :goto_0
    return-void

    .line 486
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown Audio Player "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public startPlayingAudio(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 319
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/media/AudioHandler;->getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;

    move-result-object v0

    .line 320
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->startPlaying(Ljava/lang/String;)V

    .line 321
    invoke-virtual {p0}, Lorg/apache/cordova/media/AudioHandler;->getAudioFocus()V

    .line 322
    return-void
.end method

.method public startRecordingAudio(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 286
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/media/AudioHandler;->getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;

    move-result-object v0

    .line 287
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->startRecording(Ljava/lang/String;)V

    .line 288
    return-void
.end method

.method public stopPlayingAudio(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 352
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 353
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 354
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->stopPlaying()V

    .line 356
    :cond_0
    return-void
.end method

.method public stopRecordingAudio(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "stop"    # Z

    .prologue
    .line 296
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 297
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 298
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->stopRecording(Z)V

    .line 300
    :cond_0
    return-void
.end method
