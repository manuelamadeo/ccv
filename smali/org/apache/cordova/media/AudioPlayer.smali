.class public Lorg/apache/cordova/media/AudioPlayer;
.super Ljava/lang/Object;
.source "AudioPlayer.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/media/AudioPlayer$STATE;,
        Lorg/apache/cordova/media/AudioPlayer$MODE;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "AudioPlayer"

.field private static MEDIA_DURATION:I

.field private static MEDIA_ERROR:I

.field private static MEDIA_ERR_ABORTED:I

.field private static MEDIA_ERR_NONE_ACTIVE:I

.field private static MEDIA_POSITION:I

.field private static MEDIA_STATE:I


# instance fields
.field private audioFile:Ljava/lang/String;

.field private duration:F

.field private handler:Lorg/apache/cordova/media/AudioHandler;

.field private id:Ljava/lang/String;

.field private mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

.field private player:Landroid/media/MediaPlayer;

.field private prepareOnly:Z

.field private recorder:Landroid/media/MediaRecorder;

.field private seekOnPrepared:I

.field private state:Lorg/apache/cordova/media/AudioPlayer$STATE;

.field private tempFile:Ljava/lang/String;

.field private tempFiles:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 68
    sput v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_STATE:I

    .line 69
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_DURATION:I

    .line 70
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_POSITION:I

    .line 71
    const/16 v0, 0x9

    sput v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERROR:I

    .line 74
    const/4 v0, 0x0

    sput v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_NONE_ACTIVE:I

    .line 75
    sput v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/media/AudioHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "handler"    # Lorg/apache/cordova/media/AudioHandler;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->NONE:Lorg/apache/cordova/media/AudioPlayer$MODE;

    iput-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    .line 83
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_NONE:Lorg/apache/cordova/media/AudioPlayer$STATE;

    iput-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    .line 85
    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    .line 86
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    .line 88
    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    .line 89
    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFiles:Ljava/util/LinkedList;

    .line 90
    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    .line 92
    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    .line 93
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    .line 94
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    .line 103
    iput-object p1, p0, Lorg/apache/cordova/media/AudioPlayer;->handler:Lorg/apache/cordova/media/AudioHandler;

    .line 104
    iput-object p2, p0, Lorg/apache/cordova/media/AudioPlayer;->id:Ljava/lang/String;

    .line 105
    iput-object p3, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    .line 106
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFiles:Ljava/util/LinkedList;

    .line 107
    return-void
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;Z)J
    .locals 6
    .param p0, "from"    # Ljava/io/InputStream;
    .param p1, "to"    # Ljava/io/OutputStream;
    .param p2, "skipHeader"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 241
    const/16 v4, 0x1fa0

    new-array v0, v4, [B

    .line 242
    .local v0, "buf":[B
    const-wide/16 v2, 0x0

    .line 243
    .local v2, "total":J
    if-eqz p2, :cond_0

    .line 244
    const-wide/16 v4, 0x6

    invoke-virtual {p0, v4, v5}, Ljava/io/InputStream;->skip(J)J

    .line 247
    :cond_0
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 248
    .local v1, "r":I
    const/4 v4, -0x1

    if-ne v1, v4, :cond_1

    .line 254
    return-wide v2

    .line 251
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 252
    int-to-long v4, v1

    add-long/2addr v2, v4

    .line 253
    goto :goto_0
.end method

.method private generateTempFile()Ljava/lang/String;
    .locals 4

    .prologue
    .line 110
    const/4 v0, 0x0

    .line 111
    .local v0, "tempFileName":Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mounted"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/tmprecording-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".3gp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 116
    :goto_0
    return-object v0

    .line 114
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/data/data/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->handler:Lorg/apache/cordova/media/AudioHandler;

    iget-object v2, v2, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/cache/tmprecording-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".3gp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getDurationInSeconds()F
    .locals 2

    .prologue
    .line 462
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    return v0
.end method

.method private loadAudioFile(Ljava/lang/String;)V
    .locals 10
    .param p1, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 630
    invoke-virtual {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->isStreaming(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 631
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 632
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 634
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->PLAY:Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setMode(Lorg/apache/cordova/media/AudioPlayer$MODE;)V

    .line 635
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STARTING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 636
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 637
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 663
    :goto_0
    return-void

    .line 640
    :cond_0
    const-string v0, "/android_asset/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 641
    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 642
    .local v6, "f":Ljava/lang/String;
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->handler:Lorg/apache/cordova/media/AudioHandler;

    iget-object v0, v0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v7

    .line 643
    .local v7, "fd":Landroid/content/res/AssetFileDescriptor;
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 656
    .end local v6    # "f":Ljava/lang/String;
    .end local v7    # "fd":Landroid/content/res/AssetFileDescriptor;
    :goto_1
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STARTING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 657
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 658
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 661
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioPlayer;->getDurationInSeconds()F

    move-result v0

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    goto :goto_0

    .line 646
    :cond_1
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 647
    .local v9, "fp":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 648
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 649
    .local v8, "fileInputStream":Ljava/io/FileInputStream;
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v8}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 650
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V

    goto :goto_1

    .line 653
    .end local v8    # "fileInputStream":Ljava/io/FileInputStream;
    :cond_2
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private playMode()Z
    .locals 2

    .prologue
    .line 539
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$1;->$SwitchMap$org$apache$cordova$media$AudioPlayer$MODE:[I

    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-virtual {v1}, Lorg/apache/cordova/media/AudioPlayer$MODE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 550
    :goto_0
    :pswitch_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 541
    :pswitch_1
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->PLAY:Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setMode(Lorg/apache/cordova/media/AudioPlayer$MODE;)V

    goto :goto_0

    .line 546
    :pswitch_2
    const-string v0, "AudioPlayer"

    const-string v1, "AudioPlayer Error: Can\'t play in record mode."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 547
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    .line 548
    const/4 v0, 0x0

    goto :goto_1

    .line 539
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private readyPlayer(Ljava/lang/String;)Z
    .locals 5
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 559
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioPlayer;->playMode()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 560
    sget-object v3, Lorg/apache/cordova/media/AudioPlayer$1;->$SwitchMap$org$apache$cordova$media$AudioPlayer$STATE:[I

    iget-object v4, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v4}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 615
    const-string v2, "AudioPlayer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AudioPlayer Error: startPlaying() called during invalid state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 616
    sget v2, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    .line 619
    :cond_0
    :goto_0
    return v1

    .line 562
    :pswitch_0
    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-nez v2, :cond_1

    .line 563
    new-instance v2, Landroid/media/MediaPlayer;

    invoke-direct {v2}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    .line 564
    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v2, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 567
    :cond_1
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->loadAudioFile(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 568
    :catch_0
    move-exception v0

    .line 569
    .local v0, "e":Ljava/lang/Exception;
    sget v2, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 574
    .end local v0    # "e":Ljava/lang/Exception;
    :pswitch_1
    const-string v2, "AudioPlayer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AudioPlayer Loading: startPlaying() called during media preparation: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STARTING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v4}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    iput-boolean v1, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    goto :goto_0

    :pswitch_2
    move v1, v2

    .line 580
    goto :goto_0

    .line 583
    :pswitch_3
    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_3

    .line 585
    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-nez v3, :cond_2

    .line 586
    new-instance v2, Landroid/media/MediaPlayer;

    invoke-direct {v2}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    .line 587
    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v2, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 588
    iput-boolean v1, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    .line 591
    :try_start_1
    invoke-direct {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->loadAudioFile(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 592
    :catch_1
    move-exception v0

    .line 593
    .restart local v0    # "e":Ljava/lang/Exception;
    sget v2, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 599
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v3, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 600
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->pause()V

    move v1, v2

    .line 601
    goto :goto_0

    .line 605
    :cond_3
    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->reset()V

    .line 607
    :try_start_2
    invoke-direct {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->loadAudioFile(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 608
    :catch_2
    move-exception v0

    .line 609
    .restart local v0    # "e":Ljava/lang/Exception;
    sget v2, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto/16 :goto_0

    .line 560
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private sendErrorStatus(I)V
    .locals 3
    .param p1, "errorCode"    # I

    .prologue
    .line 666
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERROR:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 667
    return-void
.end method

.method private sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V
    .locals 6
    .param p1, "messageType"    # I
    .param p2, "additionalCode"    # Ljava/lang/Integer;
    .param p3, "value"    # Ljava/lang/Float;

    .prologue
    .line 671
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 672
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Only one of additionalCode or value can be specified, not both"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 675
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 677
    .local v2, "statusDetails":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "id"

    iget-object v4, p0, Lorg/apache/cordova/media/AudioPlayer;->id:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 678
    const-string v3, "msgType"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 679
    if-eqz p2, :cond_2

    .line 680
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 681
    .local v0, "code":Lorg/json/JSONObject;
    const-string v3, "code"

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 682
    const-string v3, "value"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 691
    .end local v0    # "code":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->handler:Lorg/apache/cordova/media/AudioHandler;

    const-string v4, "status"

    invoke-virtual {v3, v4, v2}, Lorg/apache/cordova/media/AudioHandler;->sendEventMessage(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 692
    return-void

    .line 684
    :cond_2
    if-eqz p3, :cond_1

    .line 685
    :try_start_1
    const-string v3, "value"

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    float-to-double v4, v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 687
    :catch_0
    move-exception v1

    .line 688
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "AudioPlayer"

    const-string v4, "Failed to create status details"

    invoke-static {v3, v4, v1}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private setMode(Lorg/apache/cordova/media/AudioPlayer$MODE;)V
    .locals 1
    .param p1, "mode"    # Lorg/apache/cordova/media/AudioPlayer$MODE;

    .prologue
    .line 504
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    if-eq v0, p1, :cond_0

    .line 508
    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    .line 509
    return-void
.end method

.method private setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V
    .locals 3
    .param p1, "state"    # Lorg/apache/cordova/media/AudioPlayer$STATE;

    .prologue
    .line 492
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-eq v0, p1, :cond_0

    .line 493
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_STATE:I

    const/4 v1, 0x0

    invoke-virtual {p1}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 495
    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    .line 496
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 124
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    .line 125
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_PAUSED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v0, v1, :cond_1

    .line 126
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 127
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STOPPED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 129
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 130
    iput-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    .line 132
    :cond_2
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_3

    .line 133
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->stopRecording(Z)V

    .line 134
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 135
    iput-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    .line 137
    :cond_3
    return-void
.end method

.method public getCurrentAmplitude()F
    .locals 3

    .prologue
    .line 700
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    if-eqz v1, :cond_0

    .line 702
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v2, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v1, v2, :cond_0

    .line 703
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->getMaxAmplitude()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    int-to-float v1, v1

    const v2, 0x46fff400    # 32762.0f

    div-float/2addr v1, v2

    .line 710
    :goto_0
    return v1

    .line 706
    :catch_0
    move-exception v0

    .line 707
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 710
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()J
    .locals 5

    .prologue
    .line 372
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v2, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v2, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_PAUSED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v1, v2, :cond_1

    .line 373
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    .line 374
    .local v0, "curPos":I
    sget v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_POSITION:I

    const/4 v2, 0x0

    int-to-float v3, v0

    const/high16 v4, 0x447a0000    # 1000.0f

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 375
    int-to-long v2, v0

    .line 378
    .end local v0    # "curPos":I
    :goto_0
    return-wide v2

    :cond_1
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public getDuration(Ljava/lang/String;)F
    .locals 1
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 409
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_0

    .line 410
    const/high16 v0, -0x40000000    # -2.0f

    .line 425
    :goto_0
    return v0

    .line 414
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 415
    iget v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    goto :goto_0

    .line 420
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    .line 421
    invoke-virtual {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->startPlaying(Ljava/lang/String;)V

    .line 425
    iget v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    goto :goto_0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 517
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v0

    return v0
.end method

.method public isStreaming(Ljava/lang/String;)Z
    .locals 1
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 390
    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "rtsp://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 391
    :cond_0
    const/4 v0, 0x1

    .line 394
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public moveFile(Ljava/lang/String;)V
    .locals 14
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 185
    const-string v11, "/"

    invoke-virtual {p1, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 186
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v11

    const-string v12, "mounted"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 187
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-object v12, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 193
    :cond_0
    :goto_0
    iget-object v11, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFiles:Ljava/util/LinkedList;

    invoke-virtual {v11}, Ljava/util/LinkedList;->size()I

    move-result v10

    .line 194
    .local v10, "size":I
    const-string v11, "AudioPlayer"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "size = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    const/4 v11, 0x1

    if-ne v10, v11, :cond_3

    .line 198
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "renaming "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " to "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 199
    .local v7, "logMsg":Ljava/lang/String;
    const-string v11, "AudioPlayer"

    invoke-static {v11, v7}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    new-instance v1, Ljava/io/File;

    iget-object v11, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    invoke-direct {v1, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 201
    .local v1, "f":Ljava/io/File;
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v11

    if-nez v11, :cond_1

    const-string v11, "AudioPlayer"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "FAILED "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .end local v1    # "f":Ljava/io/File;
    .end local v7    # "logMsg":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 189
    .end local v10    # "size":I
    :cond_2
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "/data/data/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/cordova/media/AudioPlayer;->handler:Lorg/apache/cordova/media/AudioHandler;

    iget-object v12, v12, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v12

    invoke-virtual {v12}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "/cache/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_0

    .line 205
    .restart local v10    # "size":I
    :cond_3
    const/4 v8, 0x0

    .line 207
    .local v8, "outputStream":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v9, Ljava/io/FileOutputStream;

    new-instance v11, Ljava/io/File;

    invoke-direct {v11, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_8
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 208
    .end local v8    # "outputStream":Ljava/io/FileOutputStream;
    .local v9, "outputStream":Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    .line 209
    .local v5, "inputStream":Ljava/io/FileInputStream;
    const/4 v3, 0x0

    .line 210
    .local v3, "inputFile":Ljava/io/File;
    const/4 v2, 0x0

    .local v2, "i":I
    move-object v4, v3

    .end local v3    # "inputFile":Ljava/io/File;
    .local v4, "inputFile":Ljava/io/File;
    move-object v6, v5

    .end local v5    # "inputStream":Ljava/io/FileInputStream;
    .local v6, "inputStream":Ljava/io/FileInputStream;
    :goto_2
    if-ge v2, v10, :cond_8

    .line 212
    :try_start_1
    new-instance v3, Ljava/io/File;

    iget-object v11, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFiles:Ljava/util/LinkedList;

    invoke-virtual {v11, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-direct {v3, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 213
    .end local v4    # "inputFile":Ljava/io/File;
    .restart local v3    # "inputFile":Ljava/io/File;
    :try_start_2
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_9
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 214
    .end local v6    # "inputStream":Ljava/io/FileInputStream;
    .restart local v5    # "inputStream":Ljava/io/FileInputStream;
    if-lez v2, :cond_5

    const/4 v11, 0x1

    :goto_3
    :try_start_3
    invoke-static {v5, v9, v11}, Lorg/apache/cordova/media/AudioPlayer;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;Z)J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_a
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 218
    if-eqz v5, :cond_4

    .line 219
    :try_start_4
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 220
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 221
    const/4 v3, 0x0

    .line 210
    :cond_4
    :goto_4
    add-int/lit8 v2, v2, 0x1

    move-object v4, v3

    .end local v3    # "inputFile":Ljava/io/File;
    .restart local v4    # "inputFile":Ljava/io/File;
    move-object v6, v5

    .end local v5    # "inputStream":Ljava/io/FileInputStream;
    .restart local v6    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_2

    .line 214
    .end local v4    # "inputFile":Ljava/io/File;
    .end local v6    # "inputStream":Ljava/io/FileInputStream;
    .restart local v3    # "inputFile":Ljava/io/File;
    .restart local v5    # "inputStream":Ljava/io/FileInputStream;
    :cond_5
    const/4 v11, 0x0

    goto :goto_3

    .line 222
    :catch_0
    move-exception v0

    .line 223
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    const-string v11, "AudioPlayer"

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_4

    .line 227
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    move-object v8, v9

    .line 228
    .end local v2    # "i":I
    .end local v3    # "inputFile":Ljava/io/File;
    .end local v5    # "inputStream":Ljava/io/FileInputStream;
    .end local v9    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v0    # "e":Ljava/lang/Exception;
    .restart local v8    # "outputStream":Ljava/io/FileOutputStream;
    :goto_5
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 230
    if-eqz v8, :cond_1

    .line 231
    :try_start_7
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_1

    .line 232
    :catch_2
    move-exception v0

    .line 233
    const-string v11, "AudioPlayer"

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 215
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v8    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v2    # "i":I
    .restart local v4    # "inputFile":Ljava/io/File;
    .restart local v6    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "outputStream":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v0

    move-object v3, v4

    .end local v4    # "inputFile":Ljava/io/File;
    .restart local v3    # "inputFile":Ljava/io/File;
    move-object v5, v6

    .line 216
    .end local v6    # "inputStream":Ljava/io/FileInputStream;
    .restart local v0    # "e":Ljava/lang/Exception;
    .restart local v5    # "inputStream":Ljava/io/FileInputStream;
    :goto_6
    :try_start_8
    const-string v11, "AudioPlayer"

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 218
    if-eqz v5, :cond_4

    .line 219
    :try_start_9
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 220
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 221
    const/4 v3, 0x0

    goto :goto_4

    .line 222
    :catch_4
    move-exception v0

    .line 223
    :try_start_a
    const-string v11, "AudioPlayer"

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_4

    .line 230
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v11

    move-object v8, v9

    .end local v2    # "i":I
    .end local v3    # "inputFile":Ljava/io/File;
    .end local v5    # "inputStream":Ljava/io/FileInputStream;
    .end local v9    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v8    # "outputStream":Ljava/io/FileOutputStream;
    :goto_7
    if-eqz v8, :cond_6

    .line 231
    :try_start_b
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_7

    .line 234
    :cond_6
    :goto_8
    throw v11

    .line 218
    .end local v8    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v2    # "i":I
    .restart local v4    # "inputFile":Ljava/io/File;
    .restart local v6    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "outputStream":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v11

    move-object v3, v4

    .end local v4    # "inputFile":Ljava/io/File;
    .restart local v3    # "inputFile":Ljava/io/File;
    move-object v5, v6

    .end local v6    # "inputStream":Ljava/io/FileInputStream;
    .restart local v5    # "inputStream":Ljava/io/FileInputStream;
    :goto_9
    if-eqz v5, :cond_7

    .line 219
    :try_start_c
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 220
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_5
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 221
    const/4 v3, 0x0

    .line 224
    :cond_7
    :goto_a
    :try_start_d
    throw v11

    .line 222
    :catch_5
    move-exception v0

    .line 223
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v12, "AudioPlayer"

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto :goto_a

    .line 230
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v3    # "inputFile":Ljava/io/File;
    .end local v5    # "inputStream":Ljava/io/FileInputStream;
    .restart local v4    # "inputFile":Ljava/io/File;
    .restart local v6    # "inputStream":Ljava/io/FileInputStream;
    :cond_8
    if-eqz v9, :cond_1

    .line 231
    :try_start_e
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_6

    goto/16 :goto_1

    .line 232
    :catch_6
    move-exception v0

    .line 233
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v11, "AudioPlayer"

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 232
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "i":I
    .end local v4    # "inputFile":Ljava/io/File;
    .end local v6    # "inputStream":Ljava/io/FileInputStream;
    .end local v9    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v8    # "outputStream":Ljava/io/FileOutputStream;
    :catch_7
    move-exception v0

    .line 233
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v12, "AudioPlayer"

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_8

    .line 230
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_2
    move-exception v11

    goto :goto_7

    .line 227
    :catch_8
    move-exception v0

    goto :goto_5

    .line 218
    .end local v8    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v2    # "i":I
    .restart local v3    # "inputFile":Ljava/io/File;
    .restart local v6    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "outputStream":Ljava/io/FileOutputStream;
    :catchall_3
    move-exception v11

    move-object v5, v6

    .end local v6    # "inputStream":Ljava/io/FileInputStream;
    .restart local v5    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_9

    :catchall_4
    move-exception v11

    goto :goto_9

    .line 215
    .end local v5    # "inputStream":Ljava/io/FileInputStream;
    .restart local v6    # "inputStream":Ljava/io/FileInputStream;
    :catch_9
    move-exception v0

    move-object v5, v6

    .end local v6    # "inputStream":Ljava/io/FileInputStream;
    .restart local v5    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_6

    :catch_a
    move-exception v0

    goto :goto_6
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "player"    # Landroid/media/MediaPlayer;

    .prologue
    .line 362
    const-string v0, "AudioPlayer"

    const-string v1, "on completion is calling stopped"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STOPPED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 364
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 3
    .param p1, "player"    # Landroid/media/MediaPlayer;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I

    .prologue
    .line 474
    const-string v0, "AudioPlayer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AudioPlayer.onError("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STOPPED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    iput-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    .line 479
    invoke-virtual {p0}, Lorg/apache/cordova/media/AudioPlayer;->destroy()V

    .line 481
    invoke-direct {p0, p2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    .line 483
    const/4 v0, 0x0

    return v0
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3
    .param p1, "player"    # Landroid/media/MediaPlayer;

    .prologue
    .line 436
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 438
    iget v0, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    invoke-virtual {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->seekToPlaying(I)V

    .line 440
    iget-boolean v0, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    if-nez v0, :cond_0

    .line 441
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 442
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 443
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    .line 448
    :goto_0
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioPlayer;->getDurationInSeconds()F

    move-result v0

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    .line 450
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    .line 453
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_DURATION:I

    const/4 v1, 0x0

    iget v2, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 454
    return-void

    .line 445
    :cond_0
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STARTING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    goto :goto_0
.end method

.method public pausePlaying()V
    .locals 3

    .prologue
    .line 330
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 331
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 332
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_PAUSED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 338
    :goto_0
    return-void

    .line 335
    :cond_0
    const-string v0, "AudioPlayer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AudioPlayer Error: pausePlaying() called during invalid state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v2}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_NONE_ACTIVE:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0
.end method

.method public resumeRecording()V
    .locals 1

    .prologue
    .line 286
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->startRecording(Ljava/lang/String;)V

    .line 287
    return-void
.end method

.method public seekToPlaying(I)V
    .locals 4
    .param p1, "milliseconds"    # I

    .prologue
    .line 312
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->readyPlayer(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 313
    if-lez p1, :cond_0

    .line 314
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 316
    :cond_0
    const-string v0, "AudioPlayer"

    const-string v1, "Send a onStatus update for the new seek"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_POSITION:I

    const/4 v1, 0x0

    int-to-float v2, p1

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 322
    :goto_0
    return-void

    .line 320
    :cond_1
    iput p1, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    goto :goto_0
.end method

.method public setVolume(F)V
    .locals 2
    .param p1, "volume"    # F

    .prologue
    .line 526
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 527
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 532
    :goto_0
    return-void

    .line 529
    :cond_0
    const-string v0, "AudioPlayer"

    const-string v1, "AudioPlayer Error: Cannot set volume until the audio file is initialized."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_NONE_ACTIVE:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0
.end method

.method public startPlaying(Ljava/lang/String;)V
    .locals 2
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 299
    invoke-direct {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->readyPlayer(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 300
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 301
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 302
    iput v1, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    .line 306
    :goto_0
    return-void

    .line 304
    :cond_0
    iput-boolean v1, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    goto :goto_0
.end method

.method public startRecording(Ljava/lang/String;)V
    .locals 4
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 145
    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$1;->$SwitchMap$org$apache$cordova$media$AudioPlayer$MODE:[I

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-virtual {v2}, Lorg/apache/cordova/media/AudioPlayer$MODE;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 175
    :goto_0
    return-void

    .line 147
    :pswitch_0
    const-string v1, "AudioPlayer"

    const-string v2, "AudioPlayer Error: Can\'t record in play mode."

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    sget v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 151
    :pswitch_1
    iput-object p1, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    .line 152
    new-instance v1, Landroid/media/MediaRecorder;

    invoke-direct {v1}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    .line 153
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1, v3}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 154
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 155
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1, v3}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 156
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioPlayer;->generateTempFile()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    .line 157
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 159
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->prepare()V

    .line 160
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->start()V

    .line 161
    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 163
    :catch_0
    move-exception v0

    .line 164
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 169
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :goto_1
    sget v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 165
    :catch_1
    move-exception v0

    .line 166
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 172
    .end local v0    # "e":Ljava/io/IOException;
    :pswitch_2
    const-string v1, "AudioPlayer"

    const-string v2, "AudioPlayer Error: Already recording."

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    sget v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 145
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public stopPlaying()V
    .locals 3

    .prologue
    .line 344
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_PAUSED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v0, v1, :cond_1

    .line 345
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 346
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 347
    const-string v0, "AudioPlayer"

    const-string v1, "stopPlaying is calling stopped"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STOPPED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 354
    :goto_0
    return-void

    .line 351
    :cond_1
    const-string v0, "AudioPlayer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AudioPlayer Error: stopPlaying() called during invalid state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v2}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_NONE_ACTIVE:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0
.end method

.method public stopRecording(Z)V
    .locals 3
    .param p1, "stop"    # Z

    .prologue
    .line 261
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    if-eqz v1, :cond_1

    .line 263
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v2, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v1, v2, :cond_0

    .line 264
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->stop()V

    .line 266
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->reset()V

    .line 267
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFiles:Ljava/util/LinkedList;

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 268
    if-eqz p1, :cond_2

    .line 269
    const-string v1, "AudioPlayer"

    const-string v2, "stopping recording"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STOPPED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 271
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->moveFile(Ljava/lang/String;)V

    .line 280
    :cond_1
    :goto_0
    return-void

    .line 273
    :cond_2
    const-string v1, "AudioPlayer"

    const-string v2, "pause recording"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 276
    :catch_0
    move-exception v0

    .line 277
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
