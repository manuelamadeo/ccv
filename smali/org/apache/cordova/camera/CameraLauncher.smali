.class public Lorg/apache/cordova/camera/CameraLauncher;
.super Lorg/apache/cordova/CordovaPlugin;
.source "CameraLauncher.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# static fields
.field private static final ALLMEDIA:I = 0x2

.field private static final CAMERA:I = 0x1

.field private static final CROP_CAMERA:I = 0x64

.field private static final DATA_URL:I = 0x0

.field private static final FILE_URI:I = 0x1

.field private static final GET_All:Ljava/lang/String; = "Get All"

.field private static final GET_PICTURE:Ljava/lang/String; = "Get Picture"

.field private static final GET_VIDEO:Ljava/lang/String; = "Get Video"

.field private static final JPEG:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "CameraLauncher"

.field private static final NATIVE_URI:I = 0x2

.field public static final PERMISSION_DENIED_ERROR:I = 0x14

.field private static final PHOTOLIBRARY:I = 0x0

.field private static final PICTURE:I = 0x0

.field private static final PNG:I = 0x1

.field private static final SAVEDPHOTOALBUM:I = 0x2

.field public static final SAVE_TO_ALBUM_SEC:I = 0x1

.field public static final TAKE_PIC_SEC:I = 0x0

.field private static final VIDEO:I = 0x1

.field protected static final permissions:[Ljava/lang/String;


# instance fields
.field private allowEdit:Z

.field public callbackContext:Lorg/apache/cordova/CallbackContext;

.field private conn:Landroid/media/MediaScannerConnection;

.field private correctOrientation:Z

.field private croppedUri:Landroid/net/Uri;

.field private destType:I

.field private encodingType:I

.field private exifData:Lorg/apache/cordova/camera/ExifHelper;

.field private imageUri:Landroid/net/Uri;

.field private mQuality:I

.field private mediaType:I

.field private numPics:I

.field private orientationCorrected:Z

.field private saveToPhotoAlbum:Z

.field private scanMe:Landroid/net/Uri;

.field private srcType:I

.field private targetHeight:I

.field private targetWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 112
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.CAMERA"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/cordova/camera/CameraLauncher;->permissions:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/camera/CameraLauncher;ILandroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/camera/CameraLauncher;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/content/Intent;

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/camera/CameraLauncher;->processResultFromGallery(ILandroid/content/Intent;)V

    return-void
.end method

.method public static calculateSampleSize(IIII)I
    .locals 4
    .param p0, "srcWidth"    # I
    .param p1, "srcHeight"    # I
    .param p2, "dstWidth"    # I
    .param p3, "dstHeight"    # I

    .prologue
    .line 1129
    int-to-float v2, p0

    int-to-float v3, p1

    div-float v1, v2, v3

    .line 1130
    .local v1, "srcAspect":F
    int-to-float v2, p2

    int-to-float v3, p3

    div-float v0, v2, v3

    .line 1132
    .local v0, "dstAspect":F
    cmpl-float v2, v1, v0

    if-lez v2, :cond_0

    .line 1133
    div-int v2, p0, p2

    .line 1135
    :goto_0
    return v2

    :cond_0
    div-int v2, p1, p3

    goto :goto_0
.end method

.method private checkForDuplicateImage(I)V
    .locals 9
    .param p1, "type"    # I

    .prologue
    const/4 v8, 0x0

    .line 1182
    const/4 v3, 0x1

    .line 1183
    .local v3, "diff":I
    invoke-direct {p0}, Lorg/apache/cordova/camera/CameraLauncher;->whichContentStore()Landroid/net/Uri;

    move-result-object v0

    .line 1184
    .local v0, "contentStore":Landroid/net/Uri;
    invoke-direct {p0, v0}, Lorg/apache/cordova/camera/CameraLauncher;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v2

    .line 1185
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v1

    .line 1187
    .local v1, "currentNumOfImages":I
    const/4 v6, 0x1

    if-ne p1, v6, :cond_0

    iget-boolean v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v6, :cond_0

    .line 1188
    const/4 v3, 0x2

    .line 1192
    :cond_0
    iget v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->numPics:I

    sub-int v6, v1, v6

    if-ne v6, v3, :cond_2

    .line 1193
    invoke-interface {v2}, Landroid/database/Cursor;->moveToLast()Z

    .line 1194
    const-string v6, "_id"

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 1195
    .local v4, "id":I
    const/4 v6, 0x2

    if-ne v3, v6, :cond_1

    .line 1196
    add-int/lit8 v4, v4, -0x1

    .line 1198
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 1199
    .local v5, "uri":Landroid/net/Uri;
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v5, v8, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1200
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 1202
    .end local v4    # "id":I
    .end local v5    # "uri":Landroid/net/Uri;
    :cond_2
    return-void
.end method

.method private cleanup(ILandroid/net/Uri;Landroid/net/Uri;Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "imageType"    # I
    .param p2, "oldImage"    # Landroid/net/Uri;
    .param p3, "newImage"    # Landroid/net/Uri;
    .param p4, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 1158
    if-eqz p4, :cond_0

    .line 1159
    invoke-virtual {p4}, Landroid/graphics/Bitmap;->recycle()V

    .line 1163
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/cordova/camera/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1165
    invoke-direct {p0, p1}, Lorg/apache/cordova/camera/CameraLauncher;->checkForDuplicateImage(I)V

    .line 1167
    iget-boolean v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v0, :cond_1

    if-eqz p3, :cond_1

    .line 1168
    invoke-direct {p0, p3}, Lorg/apache/cordova/camera/CameraLauncher;->scanForGallery(Landroid/net/Uri;)V

    .line 1171
    :cond_1
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 1172
    return-void
.end method

.method private createCaptureFile(I)Ljava/io/File;
    .locals 1
    .param p1, "encodingType"    # I

    .prologue
    .line 312
    const-string v0, ""

    invoke-direct {p0, p1, v0}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(ILjava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private createCaptureFile(ILjava/lang/String;)Ljava/io/File;
    .locals 3
    .param p1, "encodingType"    # I
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 323
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 324
    const-string p2, ".Pic"

    .line 327
    :cond_0
    if-nez p1, :cond_1

    .line 328
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 335
    :goto_0
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lorg/apache/cordova/camera/CameraLauncher;->getTempDirectoryPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 329
    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 330
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 332
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid Encoding Type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private exifToDegrees(I)I
    .locals 1
    .param p1, "exifOrientation"    # I

    .prologue
    .line 815
    const/4 v0, 0x6

    if-ne p1, v0, :cond_0

    .line 816
    const/16 v0, 0x5a

    .line 822
    :goto_0
    return v0

    .line 817
    :cond_0
    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 818
    const/16 v0, 0xb4

    goto :goto_0

    .line 819
    :cond_1
    const/16 v0, 0x8

    if-ne p1, v0, :cond_2

    .line 820
    const/16 v0, 0x10e

    goto :goto_0

    .line 822
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getMimetypeForFormat(I)Ljava/lang/String;
    .locals 1
    .param p1, "outputFormat"    # I

    .prologue
    .line 597
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string v0, "image/png"

    .line 599
    :goto_0
    return-object v0

    .line 598
    :cond_0
    if-nez p1, :cond_1

    const-string v0, "image/jpeg"

    goto :goto_0

    .line 599
    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method private getPicturesPath()Ljava/lang/String;
    .locals 6

    .prologue
    .line 575
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMdd_HHmmss"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 576
    .local v3, "timeStamp":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "IMG_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v4, :cond_0

    const-string v4, ".jpg"

    :goto_0
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 577
    .local v1, "imageFileName":Ljava/lang/String;
    sget-object v4, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v4}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 579
    .local v2, "storageDir":Ljava/io/File;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 580
    .local v0, "galleryPath":Ljava/lang/String;
    return-object v0

    .line 576
    .end local v0    # "galleryPath":Ljava/lang/String;
    .end local v1    # "imageFileName":Ljava/lang/String;
    .end local v2    # "storageDir":Ljava/io/File;
    :cond_0
    const-string v4, ".png"

    goto :goto_0
.end method

.method private getScaledAndRotatedBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 32
    .param p1, "imageUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 910
    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-gtz v4, :cond_2

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-gtz v4, :cond_2

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-nez v4, :cond_2

    .line 911
    const/4 v14, 0x0

    .line 912
    .local v14, "fileStream":Ljava/io/InputStream;
    const/16 v16, 0x0

    .line 914
    .local v16, "image":Landroid/graphics/Bitmap;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/apache/cordova/camera/FileHelper;->getInputStreamFromUriString(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/io/InputStream;

    move-result-object v14

    .line 915
    invoke-static {v14}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v16

    .line 917
    if-eqz v14, :cond_0

    .line 919
    :try_start_1
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1060
    .end local v14    # "fileStream":Ljava/io/InputStream;
    .end local v16    # "image":Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    return-object v16

    .line 920
    .restart local v14    # "fileStream":Ljava/io/InputStream;
    .restart local v16    # "image":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v10

    .line 921
    .local v10, "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 917
    .end local v10    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    if-eqz v14, :cond_1

    .line 919
    :try_start_2
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 922
    :cond_1
    :goto_1
    throw v4

    .line 920
    :catch_1
    move-exception v10

    .line 921
    .restart local v10    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing file input stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 936
    .end local v10    # "e":Ljava/io/IOException;
    .end local v14    # "fileStream":Ljava/io/InputStream;
    .end local v16    # "image":Landroid/graphics/Bitmap;
    :cond_2
    const/16 v17, 0x0

    .line 937
    .local v17, "localFile":Ljava/io/File;
    const/4 v15, 0x0

    .line 938
    .local v15, "galleryUri":Landroid/net/Uri;
    const/16 v23, 0x0

    .line 940
    .local v23, "rotate":I
    :try_start_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/apache/cordova/camera/FileHelper;->getInputStreamFromUriString(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/io/InputStream;

    move-result-object v14

    .line 941
    .restart local v14    # "fileStream":Ljava/io/InputStream;
    if-eqz v14, :cond_4

    .line 943
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMdd_HHmmss"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v29

    .line 944
    .local v29, "timeStamp":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "IMG_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v29

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v4, :cond_7

    const-string v4, ".jpg"

    :goto_2
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 945
    .local v12, "fileName":Ljava/lang/String;
    new-instance v18, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/camera/CameraLauncher;->getTempDirectoryPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 946
    .end local v17    # "localFile":Ljava/io/File;
    .local v18, "localFile":Ljava/io/File;
    :try_start_4
    invoke-static/range {v18 .. v18}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v15

    .line 947
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Ljava/io/InputStream;Landroid/net/Uri;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_9

    .line 949
    :try_start_5
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v4, v5}, Lorg/apache/cordova/camera/FileHelper;->getMimeType(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object v19

    .line 950
    .local v19, "mimeType":Ljava/lang/String;
    const-string v4, "image/jpeg"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 952
    invoke-virtual {v15}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file://"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13

    .line 954
    .local v13, "filePath":Ljava/lang/String;
    new-instance v4, Lorg/apache/cordova/camera/ExifHelper;

    invoke-direct {v4}, Lorg/apache/cordova/camera/ExifHelper;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    .line 955
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    invoke-virtual {v4, v13}, Lorg/apache/cordova/camera/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 957
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-eqz v4, :cond_3

    .line 958
    new-instance v11, Landroid/media/ExifInterface;

    invoke-direct {v11, v13}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 959
    .local v11, "exif":Landroid/media/ExifInterface;
    const-string v4, "Orientation"

    const/4 v5, 0x0

    invoke-virtual {v11, v4, v5}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/cordova/camera/CameraLauncher;->exifToDegrees(I)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-result v23

    .end local v11    # "exif":Landroid/media/ExifInterface;
    .end local v13    # "filePath":Ljava/lang/String;
    :cond_3
    move-object/from16 v17, v18

    .line 978
    .end local v12    # "fileName":Ljava/lang/String;
    .end local v18    # "localFile":Ljava/io/File;
    .end local v19    # "mimeType":Ljava/lang/String;
    .end local v29    # "timeStamp":Ljava/lang/String;
    .restart local v17    # "localFile":Ljava/io/File;
    :cond_4
    :goto_3
    :try_start_6
    new-instance v22, Landroid/graphics/BitmapFactory$Options;

    invoke-direct/range {v22 .. v22}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 979
    .local v22, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v4, 0x1

    move-object/from16 v0, v22

    iput-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 980
    const/4 v14, 0x0

    .line 982
    :try_start_7
    invoke-virtual {v15}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v4, v5}, Lorg/apache/cordova/camera/FileHelper;->getInputStreamFromUriString(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/io/InputStream;

    move-result-object v14

    .line 983
    const/4 v4, 0x0

    move-object/from16 v0, v22

    invoke-static {v14, v4, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 985
    if-eqz v14, :cond_5

    .line 987
    :try_start_8
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 996
    :cond_5
    :goto_4
    :try_start_9
    move-object/from16 v0, v22

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-eqz v4, :cond_6

    move-object/from16 v0, v22

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    if-nez v4, :cond_a

    .line 997
    :cond_6
    const/16 v16, 0x0

    .line 1064
    if-eqz v17, :cond_0

    .line 1065
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 944
    .end local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v29    # "timeStamp":Ljava/lang/String;
    :cond_7
    :try_start_a
    const-string v4, ".png"
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3

    goto/16 :goto_2

    .line 962
    .end local v17    # "localFile":Ljava/io/File;
    .restart local v12    # "fileName":Ljava/lang/String;
    .restart local v18    # "localFile":Ljava/io/File;
    :catch_2
    move-exception v20

    .line 963
    .local v20, "oe":Ljava/lang/Exception;
    :try_start_b
    const-string v4, "CameraLauncher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to read Exif data: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_9

    .line 964
    const/16 v23, 0x0

    move-object/from16 v17, v18

    .end local v18    # "localFile":Ljava/io/File;
    .restart local v17    # "localFile":Ljava/io/File;
    goto :goto_3

    .line 968
    .end local v12    # "fileName":Ljava/lang/String;
    .end local v14    # "fileStream":Ljava/io/InputStream;
    .end local v20    # "oe":Ljava/lang/Exception;
    .end local v29    # "timeStamp":Ljava/lang/String;
    :catch_3
    move-exception v10

    .line 970
    .local v10, "e":Ljava/lang/Exception;
    :goto_5
    const-string v4, "CameraLauncher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception while getting input stream: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v10}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 971
    const/16 v16, 0x0

    goto/16 :goto_0

    .line 988
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v14    # "fileStream":Ljava/io/InputStream;
    .restart local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    :catch_4
    move-exception v10

    .line 989
    .local v10, "e":Ljava/io/IOException;
    :try_start_c
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    goto :goto_4

    .line 1064
    .end local v10    # "e":Ljava/io/IOException;
    .end local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    :catchall_1
    move-exception v4

    if-eqz v17, :cond_8

    .line 1065
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    :cond_8
    throw v4

    .line 985
    .restart local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    :catchall_2
    move-exception v4

    if-eqz v14, :cond_9

    .line 987
    :try_start_d
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_5
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 990
    :cond_9
    :goto_6
    :try_start_e
    throw v4

    .line 988
    :catch_5
    move-exception v10

    .line 989
    .restart local v10    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing file input stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    .line 1001
    .end local v10    # "e":Ljava/io/IOException;
    :cond_a
    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-gtz v4, :cond_b

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-gtz v4, :cond_b

    .line 1002
    move-object/from16 v0, v22

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move-object/from16 v0, p0

    iput v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 1003
    move-object/from16 v0, v22

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move-object/from16 v0, p0

    iput v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 1008
    :cond_b
    const/16 v24, 0x0

    .line 1009
    .local v24, "rotated":Z
    const/16 v4, 0x5a

    move/from16 v0, v23

    if-eq v0, v4, :cond_c

    const/16 v4, 0x10e

    move/from16 v0, v23

    if-ne v0, v4, :cond_e

    .line 1010
    :cond_c
    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move/from16 v26, v0

    .line 1011
    .local v26, "rotatedWidth":I
    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v25, v0

    .line 1012
    .local v25, "rotatedHeight":I
    const/16 v24, 0x1

    .line 1019
    :goto_7
    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/camera/CameraLauncher;->calculateAspectRatio(II)[I

    move-result-object v31

    .line 1023
    .local v31, "widthHeight":[I
    const/4 v4, 0x0

    move-object/from16 v0, v22

    iput-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 1024
    const/4 v4, 0x0

    aget v4, v31, v4

    const/4 v5, 0x1

    aget v5, v31, v5

    move/from16 v0, v26

    move/from16 v1, v25

    invoke-static {v0, v1, v4, v5}, Lorg/apache/cordova/camera/CameraLauncher;->calculateSampleSize(IIII)I

    move-result v4

    move-object/from16 v0, v22

    iput v4, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 1025
    const/16 v30, 0x0

    .line 1027
    .local v30, "unscaledBitmap":Landroid/graphics/Bitmap;
    :try_start_f
    invoke-virtual {v15}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v4, v5}, Lorg/apache/cordova/camera/FileHelper;->getInputStreamFromUriString(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/io/InputStream;

    move-result-object v14

    .line 1028
    const/4 v4, 0x0

    move-object/from16 v0, v22

    invoke-static {v14, v4, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    move-result-object v30

    .line 1030
    if-eqz v14, :cond_d

    .line 1032
    :try_start_10
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_6
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    .line 1038
    :cond_d
    :goto_8
    if-nez v30, :cond_10

    .line 1039
    const/16 v16, 0x0

    .line 1064
    if-eqz v17, :cond_0

    .line 1065
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 1014
    .end local v25    # "rotatedHeight":I
    .end local v26    # "rotatedWidth":I
    .end local v30    # "unscaledBitmap":Landroid/graphics/Bitmap;
    .end local v31    # "widthHeight":[I
    :cond_e
    :try_start_11
    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v26, v0

    .line 1015
    .restart local v26    # "rotatedWidth":I
    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move/from16 v25, v0

    .restart local v25    # "rotatedHeight":I
    goto :goto_7

    .line 1033
    .restart local v30    # "unscaledBitmap":Landroid/graphics/Bitmap;
    .restart local v31    # "widthHeight":[I
    :catch_6
    move-exception v10

    .line 1034
    .restart local v10    # "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    goto :goto_8

    .line 1030
    .end local v10    # "e":Ljava/io/IOException;
    :catchall_3
    move-exception v4

    if-eqz v14, :cond_f

    .line 1032
    :try_start_12
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_7
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    .line 1035
    :cond_f
    :goto_9
    :try_start_13
    throw v4

    .line 1033
    :catch_7
    move-exception v10

    .line 1034
    .restart local v10    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing file input stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 1042
    .end local v10    # "e":Ljava/io/IOException;
    :cond_10
    if-nez v24, :cond_14

    const/4 v4, 0x0

    aget v28, v31, v4

    .line 1043
    .local v28, "scaledWidth":I
    :goto_a
    if-nez v24, :cond_15

    const/4 v4, 0x1

    aget v27, v31, v4

    .line 1045
    .local v27, "scaledHeight":I
    :goto_b
    const/4 v4, 0x1

    move-object/from16 v0, v30

    move/from16 v1, v28

    move/from16 v2, v27

    invoke-static {v0, v1, v2, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 1046
    .local v3, "scaledBitmap":Landroid/graphics/Bitmap;
    move-object/from16 v0, v30

    if-eq v3, v0, :cond_11

    .line 1047
    invoke-virtual/range {v30 .. v30}, Landroid/graphics/Bitmap;->recycle()V

    .line 1048
    const/16 v30, 0x0

    .line 1050
    :cond_11
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-eqz v4, :cond_12

    if-eqz v23, :cond_12

    .line 1051
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 1052
    .local v8, "matrix":Landroid/graphics/Matrix;
    move/from16 v0, v23

    int-to-float v4, v0

    invoke-virtual {v8, v4}, Landroid/graphics/Matrix;->setRotate(F)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_1

    .line 1054
    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_14
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    const/4 v9, 0x1

    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 1055
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->orientationCorrected:Z
    :try_end_14
    .catch Ljava/lang/OutOfMemoryError; {:try_start_14 .. :try_end_14} :catch_8
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    .line 1064
    .end local v8    # "matrix":Landroid/graphics/Matrix;
    :cond_12
    :goto_c
    if-eqz v17, :cond_13

    .line 1065
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    :cond_13
    move-object/from16 v16, v3

    .line 1060
    goto/16 :goto_0

    .line 1042
    .end local v3    # "scaledBitmap":Landroid/graphics/Bitmap;
    .end local v27    # "scaledHeight":I
    .end local v28    # "scaledWidth":I
    :cond_14
    const/4 v4, 0x1

    :try_start_15
    aget v28, v31, v4

    goto :goto_a

    .line 1043
    .restart local v28    # "scaledWidth":I
    :cond_15
    const/4 v4, 0x0

    aget v27, v31, v4

    goto :goto_b

    .line 1056
    .restart local v3    # "scaledBitmap":Landroid/graphics/Bitmap;
    .restart local v8    # "matrix":Landroid/graphics/Matrix;
    .restart local v27    # "scaledHeight":I
    :catch_8
    move-exception v21

    .line 1057
    .local v21, "oom":Ljava/lang/OutOfMemoryError;
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->orientationCorrected:Z
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_1

    goto :goto_c

    .line 968
    .end local v3    # "scaledBitmap":Landroid/graphics/Bitmap;
    .end local v8    # "matrix":Landroid/graphics/Matrix;
    .end local v17    # "localFile":Ljava/io/File;
    .end local v21    # "oom":Ljava/lang/OutOfMemoryError;
    .end local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v24    # "rotated":Z
    .end local v25    # "rotatedHeight":I
    .end local v26    # "rotatedWidth":I
    .end local v27    # "scaledHeight":I
    .end local v28    # "scaledWidth":I
    .end local v30    # "unscaledBitmap":Landroid/graphics/Bitmap;
    .end local v31    # "widthHeight":[I
    .restart local v12    # "fileName":Ljava/lang/String;
    .restart local v18    # "localFile":Ljava/io/File;
    .restart local v29    # "timeStamp":Ljava/lang/String;
    :catch_9
    move-exception v10

    move-object/from16 v17, v18

    .end local v18    # "localFile":Ljava/io/File;
    .restart local v17    # "localFile":Ljava/io/File;
    goto/16 :goto_5
.end method

.method private getTempDirectoryPath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 207
    const/4 v0, 0x0

    .line 210
    .local v0, "cache":Ljava/io/File;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mounted"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 211
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    .line 219
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 220
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 215
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method private getUriFromMediaStore()Landroid/net/Uri;
    .locals 6

    .prologue
    .line 884
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 885
    .local v3, "values":Landroid/content/ContentValues;
    const-string v4, "mime_type"

    const-string v5, "image/jpeg"

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 888
    :try_start_0
    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 898
    :goto_0
    return-object v2

    .line 889
    :catch_0
    move-exception v0

    .line 890
    .local v0, "e":Ljava/lang/RuntimeException;
    const-string v4, "CameraLauncher"

    const-string v5, "Can\'t write to external media storage."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    :try_start_1
    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .local v2, "uri":Landroid/net/Uri;
    goto :goto_0

    .line 893
    .end local v2    # "uri":Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 894
    .local v1, "ex":Ljava/lang/RuntimeException;
    const-string v4, "CameraLauncher"

    const-string v5, "Can\'t write to internal media storage."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 895
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private outputModifiedBitmap(Landroid/graphics/Bitmap;Landroid/net/Uri;)Ljava/lang/String;
    .locals 8
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 605
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v7, "yyyyMMdd_HHmmss"

    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    .line 606
    .local v5, "timeStamp":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "IMG_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v6, :cond_2

    const-string v6, ".jpg"

    :goto_0
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 607
    .local v2, "fileName":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lorg/apache/cordova/camera/CameraLauncher;->getTempDirectoryPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 609
    .local v3, "modifiedPath":Ljava/lang/String;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 610
    .local v4, "os":Ljava/io/OutputStream;
    iget v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v6, :cond_3

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 614
    .local v0, "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :goto_1
    iget v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    invoke-virtual {p1, v0, v6, v4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 615
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 617
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    if-eqz v6, :cond_1

    iget v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v6, :cond_1

    .line 619
    :try_start_0
    iget-boolean v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-eqz v6, :cond_0

    iget-boolean v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->orientationCorrected:Z

    if-eqz v6, :cond_0

    .line 620
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    invoke-virtual {v6}, Lorg/apache/cordova/camera/ExifHelper;->resetOrientation()V

    .line 622
    :cond_0
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    invoke-virtual {v6, v3}, Lorg/apache/cordova/camera/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 623
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    invoke-virtual {v6}, Lorg/apache/cordova/camera/ExifHelper;->writeExifData()V

    .line 624
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 629
    :cond_1
    :goto_2
    return-object v3

    .line 606
    .end local v0    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "modifiedPath":Ljava/lang/String;
    .end local v4    # "os":Ljava/io/OutputStream;
    :cond_2
    const-string v6, ".png"

    goto :goto_0

    .line 610
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "modifiedPath":Ljava/lang/String;
    .restart local v4    # "os":Ljava/io/OutputStream;
    :cond_3
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_1

    .line 625
    .restart local v0    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :catch_0
    move-exception v1

    .line 626
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method private performCrop(Landroid/net/Uri;ILandroid/content/Intent;)V
    .locals 8
    .param p1, "picUri"    # Landroid/net/Uri;
    .param p2, "destType"    # I
    .param p3, "cameraIntent"    # Landroid/content/Intent;

    .prologue
    .line 402
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.android.camera.action.CROP"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 404
    .local v1, "cropIntent":Landroid/content/Intent;
    const-string v3, "image/*"

    invoke-virtual {v1, p1, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 406
    const-string v3, "crop"

    const-string v4, "true"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 409
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-lez v3, :cond_0

    .line 410
    const-string v3, "outputX"

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 412
    :cond_0
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v3, :cond_1

    .line 413
    const-string v3, "outputY"

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 415
    :cond_1
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v3, :cond_2

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-lez v3, :cond_2

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-ne v3, v4, :cond_2

    .line 416
    const-string v3, "aspectX"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 417
    const-string v3, "aspectY"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 420
    :cond_2
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(ILjava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 421
    const-string v3, "output"

    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 425
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    if-eqz v3, :cond_3

    .line 426
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    add-int/lit8 v4, p2, 0x64

    invoke-interface {v3, p0, v1, v4}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 440
    .end local v1    # "cropIntent":Landroid/content/Intent;
    :cond_3
    :goto_0
    return-void

    .line 429
    :catch_0
    move-exception v0

    .line 430
    .local v0, "anfe":Landroid/content/ActivityNotFoundException;
    const-string v3, "CameraLauncher"

    const-string v4, "Crop operation not supported on this device"

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    :try_start_1
    invoke-direct {p0, p2, p3}, Lorg/apache/cordova/camera/CameraLauncher;->processResultFromCamera(ILandroid/content/Intent;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 434
    :catch_1
    move-exception v2

    .line 436
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 437
    const-string v3, "CameraLauncher"

    const-string v4, "Unable to write to file"

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private processResultFromCamera(ILandroid/content/Intent;)V
    .locals 14
    .param p1, "destType"    # I
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 449
    const/4 v7, 0x0

    .line 452
    .local v7, "rotate":I
    new-instance v3, Lorg/apache/cordova/camera/ExifHelper;

    invoke-direct {v3}, Lorg/apache/cordova/camera/ExifHelper;-><init>()V

    .line 453
    .local v3, "exif":Lorg/apache/cordova/camera/ExifHelper;
    iget-boolean v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v10, :cond_3

    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v10, :cond_3

    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 454
    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lorg/apache/cordova/camera/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 457
    .local v8, "sourcePath":Ljava/lang/String;
    :goto_0
    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v10, :cond_0

    .line 460
    :try_start_0
    invoke-virtual {v3, v8}, Lorg/apache/cordova/camera/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 461
    invoke-virtual {v3}, Lorg/apache/cordova/camera/ExifHelper;->readExifData()V

    .line 462
    invoke-virtual {v3}, Lorg/apache/cordova/camera/ExifHelper;->getOrientation()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    .line 469
    :cond_0
    :goto_1
    const/4 v0, 0x0

    .line 470
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/4 v5, 0x0

    .line 475
    .local v5, "galleryUri":Landroid/net/Uri;
    iget-boolean v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v10, :cond_1

    .line 476
    new-instance v10, Ljava/io/File;

    invoke-direct {p0}, Lorg/apache/cordova/camera/CameraLauncher;->getPicturesPath()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    .line 478
    iget-boolean v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v10, :cond_4

    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v10, :cond_4

    .line 479
    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    invoke-direct {p0, v10, v5}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 484
    :goto_2
    invoke-direct {p0, v5}, Lorg/apache/cordova/camera/CameraLauncher;->refreshGallery(Landroid/net/Uri;)V

    .line 488
    :cond_1
    if-nez p1, :cond_7

    .line 489
    invoke-direct {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->getScaledAndRotatedBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 491
    if-nez v0, :cond_2

    .line 493
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v10

    const-string v11, "data"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    check-cast v0, Landroid/graphics/Bitmap;

    .line 497
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2
    if-nez v0, :cond_5

    .line 498
    const-string v10, "CameraLauncher"

    const-string v11, "I either have a null image path or bitmap"

    invoke-static {v10, v11}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    const-string v10, "Unable to create bitmap!"

    invoke-virtual {p0, v10}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    .line 571
    :goto_3
    return-void

    .line 454
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "galleryUri":Landroid/net/Uri;
    .end local v8    # "sourcePath":Ljava/lang/String;
    :cond_3
    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Landroid/net/Uri;

    .line 455
    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lorg/apache/cordova/camera/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_0

    .line 464
    .restart local v8    # "sourcePath":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 465
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 481
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v5    # "galleryUri":Landroid/net/Uri;
    :cond_4
    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-direct {p0, v10, v5}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V

    goto :goto_2

    .line 504
    :cond_5
    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v0, v10}, Lorg/apache/cordova/camera/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;I)V

    .line 506
    iget-boolean v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-nez v10, :cond_6

    .line 507
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lorg/apache/cordova/camera/CameraLauncher;->checkForDuplicateImage(I)V

    .line 569
    :cond_6
    :goto_4
    const/4 v10, 0x1

    iget-object v11, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-direct {p0, v10, v11, v5, v0}, Lorg/apache/cordova/camera/CameraLauncher;->cleanup(ILandroid/net/Uri;Landroid/net/Uri;Landroid/graphics/Bitmap;)V

    .line 570
    const/4 v0, 0x0

    .line 571
    goto :goto_3

    .line 512
    :cond_7
    const/4 v10, 0x1

    if-eq p1, v10, :cond_8

    const/4 v10, 0x2

    if-ne p1, v10, :cond_f

    .line 514
    :cond_8
    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    const/4 v11, -0x1

    if-ne v10, v11, :cond_b

    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    const/4 v11, -0x1

    if-ne v10, v11, :cond_b

    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    const/16 v11, 0x64

    if-ne v10, v11, :cond_b

    iget-boolean v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-nez v10, :cond_b

    .line 519
    iget-boolean v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v10, :cond_9

    .line 520
    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_4

    .line 522
    :cond_9
    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v10, v11}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(ILjava/lang/String;)Ljava/io/File;

    move-result-object v10

    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v9

    .line 524
    .local v9, "uri":Landroid/net/Uri;
    iget-boolean v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v10, :cond_a

    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v10, :cond_a

    .line 525
    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    invoke-direct {p0, v10, v9}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 530
    :goto_5
    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v9}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_4

    .line 527
    :cond_a
    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-direct {p0, v10, v9}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V

    goto :goto_5

    .line 533
    .end local v9    # "uri":Landroid/net/Uri;
    :cond_b
    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v10, v11}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(ILjava/lang/String;)Ljava/io/File;

    move-result-object v10

    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v9

    .line 534
    .restart local v9    # "uri":Landroid/net/Uri;
    invoke-direct {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->getScaledAndRotatedBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 537
    if-nez v0, :cond_c

    .line 538
    const-string v10, "CameraLauncher"

    const-string v11, "I either have a null image path or bitmap"

    invoke-static {v10, v11}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    const-string v10, "Unable to create bitmap!"

    invoke-virtual {p0, v10}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 545
    :cond_c
    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v10}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    invoke-virtual {v10, v9}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v6

    .line 546
    .local v6, "os":Ljava/io/OutputStream;
    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v10, :cond_e

    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 550
    .local v1, "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :goto_6
    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    invoke-virtual {v0, v1, v10, v6}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 551
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 554
    iget v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v10, :cond_d

    .line 556
    invoke-virtual {v9}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 557
    .local v4, "exifPath":Ljava/lang/String;
    invoke-virtual {v3, v4}, Lorg/apache/cordova/camera/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 558
    invoke-virtual {v3}, Lorg/apache/cordova/camera/ExifHelper;->writeExifData()V

    .line 562
    .end local v4    # "exifPath":Ljava/lang/String;
    :cond_d
    iget-object v10, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v9}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 546
    .end local v1    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :cond_e
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_6

    .line 566
    .end local v6    # "os":Ljava/io/OutputStream;
    .end local v9    # "uri":Landroid/net/Uri;
    :cond_f
    new-instance v10, Ljava/lang/IllegalStateException;

    invoke-direct {v10}, Ljava/lang/IllegalStateException;-><init>()V

    throw v10
.end method

.method private processResultFromGallery(ILandroid/content/Intent;)V
    .locals 12
    .param p1, "destType"    # I
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 641
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    .line 642
    .local v6, "uri":Landroid/net/Uri;
    if-nez v6, :cond_0

    .line 643
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v8, :cond_1

    .line 644
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 650
    :cond_0
    const/4 v5, 0x0

    .line 652
    .local v5, "rotate":I
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v6, v8}, Lorg/apache/cordova/camera/FileHelper;->getRealPath(Landroid/net/Uri;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object v2

    .line 653
    .local v2, "fileLocation":Ljava/lang/String;
    const-string v8, "CameraLauncher"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "File locaton is: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 657
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    if-eqz v8, :cond_2

    .line 658
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v8, v2}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 725
    .end local v2    # "fileLocation":Ljava/lang/String;
    .end local v5    # "rotate":I
    :goto_0
    return-void

    .line 646
    :cond_1
    const-string v8, "null data from photo library"

    invoke-virtual {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 661
    .restart local v2    # "fileLocation":Ljava/lang/String;
    .restart local v5    # "rotate":I
    :cond_2
    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    .line 663
    .local v7, "uriString":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v7, v8}, Lorg/apache/cordova/camera/FileHelper;->getMimeType(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object v3

    .line 667
    .local v3, "mimeType":Ljava/lang/String;
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_4

    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_4

    const/4 v8, 0x1

    if-eq p1, v8, :cond_3

    const/4 v8, 0x2

    if-ne p1, v8, :cond_4

    :cond_3
    iget-boolean v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-nez v8, :cond_4

    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 669
    invoke-direct {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->getMimetypeForFormat(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 671
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v8, v7}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_0

    .line 674
    :cond_4
    const-string v8, "image/jpeg"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5

    const-string v8, "image/png"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 675
    const-string v8, "CameraLauncher"

    const-string v9, "I either have a null image path or bitmap"

    invoke-static {v8, v9}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 676
    const-string v8, "Unable to retrieve path to picture!"

    invoke-virtual {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 679
    :cond_5
    const/4 v0, 0x0

    .line 681
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :try_start_0
    invoke-direct {p0, v7}, Lorg/apache/cordova/camera/CameraLauncher;->getScaledAndRotatedBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 685
    :goto_1
    if-nez v0, :cond_6

    .line 686
    const-string v8, "CameraLauncher"

    const-string v9, "I either have a null image path or bitmap"

    invoke-static {v8, v9}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 687
    const-string v8, "Unable to create bitmap!"

    invoke-virtual {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 682
    :catch_0
    move-exception v1

    .line 683
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 692
    .end local v1    # "e":Ljava/io/IOException;
    :cond_6
    if-nez p1, :cond_9

    .line 693
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;I)V

    .line 718
    :cond_7
    :goto_2
    if-eqz v0, :cond_8

    .line 719
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 720
    const/4 v0, 0x0

    .line 722
    :cond_8
    invoke-static {}, Ljava/lang/System;->gc()V

    goto :goto_0

    .line 697
    :cond_9
    const/4 v8, 0x1

    if-eq p1, v8, :cond_a

    const/4 v8, 0x2

    if-ne p1, v8, :cond_7

    .line 699
    :cond_a
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v8, :cond_b

    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-gtz v8, :cond_d

    :cond_b
    iget-boolean v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-eqz v8, :cond_c

    iget-boolean v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->orientationCorrected:Z

    if-nez v8, :cond_d

    :cond_c
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 701
    invoke-direct {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->getMimetypeForFormat(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_e

    .line 704
    :cond_d
    :try_start_1
    invoke-direct {p0, v0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->outputModifiedBitmap(Landroid/graphics/Bitmap;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    .line 707
    .local v4, "modifiedPath":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "file://"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "?"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 709
    .end local v4    # "modifiedPath":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 710
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 711
    const-string v8, "Error retrieving image."

    invoke-virtual {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_2

    .line 715
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_e
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v8, v2}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_2
.end method

.method private queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;
    .locals 6
    .param p1, "contentStore"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 1145
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

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

.method private refreshGallery(Landroid/net/Uri;)V
    .locals 2
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    .line 585
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 586
    .local v0, "mediaScanIntent":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 587
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 588
    return-void
.end method

.method private scanForGallery(Landroid/net/Uri;)V
    .locals 2
    .param p1, "newImage"    # Landroid/net/Uri;

    .prologue
    .line 1253
    iput-object p1, p0, Lorg/apache/cordova/camera/CameraLauncher;->scanMe:Landroid/net/Uri;

    .line 1254
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    if-eqz v0, :cond_0

    .line 1255
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 1257
    :cond_0
    new-instance v0, Landroid/media/MediaScannerConnection;

    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    iput-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    .line 1258
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->connect()V

    .line 1259
    return-void
.end method

.method private whichContentStore()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 1209
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1210
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 1212
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0
.end method

.method private writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 2
    .param p1, "src"    # Landroid/net/Uri;
    .param p2, "dest"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 873
    new-instance v0, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/cordova/camera/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 874
    .local v0, "fis":Ljava/io/FileInputStream;
    invoke-direct {p0, v0, p2}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Ljava/io/InputStream;Landroid/net/Uri;)V

    .line 876
    return-void
.end method

.method private writeUncompressedImage(Ljava/io/InputStream;Landroid/net/Uri;)V
    .locals 7
    .param p1, "fis"    # Ljava/io/InputStream;
    .param p2, "dest"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 836
    const/4 v3, 0x0

    .line 838
    .local v3, "os":Ljava/io/OutputStream;
    :try_start_0
    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, p2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v3

    .line 839
    const/16 v4, 0x1000

    new-array v0, v4, [B

    .line 841
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_2

    .line 842
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 846
    .end local v0    # "buffer":[B
    .end local v2    # "len":I
    :catchall_0
    move-exception v4

    if-eqz v3, :cond_0

    .line 848
    :try_start_1
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 853
    :cond_0
    :goto_1
    if-eqz p1, :cond_1

    .line 855
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 858
    :cond_1
    :goto_2
    throw v4

    .line 844
    .restart local v0    # "buffer":[B
    .restart local v2    # "len":I
    :cond_2
    :try_start_3
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 846
    if-eqz v3, :cond_3

    .line 848
    :try_start_4
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 853
    :cond_3
    :goto_3
    if-eqz p1, :cond_4

    .line 855
    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 861
    :cond_4
    :goto_4
    return-void

    .line 849
    :catch_0
    move-exception v1

    .line 850
    .local v1, "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing output stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 856
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 857
    .restart local v1    # "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 849
    .end local v0    # "buffer":[B
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "len":I
    :catch_2
    move-exception v1

    .line 850
    .restart local v1    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing output stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 856
    .end local v1    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v1

    .line 857
    .restart local v1    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing file input stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method


# virtual methods
.method public calculateAspectRatio(II)[I
    .locals 12
    .param p1, "origWidth"    # I
    .param p2, "origHeight"    # I

    .prologue
    .line 1079
    iget v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 1080
    .local v1, "newWidth":I
    iget v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 1083
    .local v0, "newHeight":I
    if-gtz v1, :cond_1

    if-gtz v0, :cond_1

    .line 1084
    move v1, p1

    .line 1085
    move v0, p2

    .line 1112
    :cond_0
    :goto_0
    const/4 v7, 0x2

    new-array v6, v7, [I

    .line 1113
    .local v6, "retval":[I
    const/4 v7, 0x0

    aput v1, v6, v7

    .line 1114
    const/4 v7, 0x1

    aput v0, v6, v7

    .line 1115
    return-object v6

    .line 1088
    .end local v6    # "retval":[I
    :cond_1
    if-lez v1, :cond_2

    if-gtz v0, :cond_2

    .line 1089
    int-to-double v8, v1

    int-to-double v10, p1

    div-double/2addr v8, v10

    int-to-double v10, p2

    mul-double/2addr v8, v10

    double-to-int v0, v8

    goto :goto_0

    .line 1092
    :cond_2
    if-gtz v1, :cond_3

    if-lez v0, :cond_3

    .line 1093
    int-to-double v8, v0

    int-to-double v10, p2

    div-double/2addr v8, v10

    int-to-double v10, p1

    mul-double/2addr v8, v10

    double-to-int v1, v8

    goto :goto_0

    .line 1102
    :cond_3
    int-to-double v8, v1

    int-to-double v10, v0

    div-double v2, v8, v10

    .line 1103
    .local v2, "newRatio":D
    int-to-double v8, p1

    int-to-double v10, p2

    div-double v4, v8, v10

    .line 1105
    .local v4, "origRatio":D
    cmpl-double v7, v4, v2

    if-lez v7, :cond_4

    .line 1106
    mul-int v7, v1, p2

    div-int v0, v7, p1

    goto :goto_0

    .line 1107
    :cond_4
    cmpg-double v7, v4, v2

    if-gez v7, :cond_0

    .line 1108
    mul-int v7, v0, p1

    div-int v1, v7, p2

    goto :goto_0
.end method

.method public callTakePicture(II)V
    .locals 9
    .param p1, "returnType"    # I
    .param p2, "encodingType"    # I

    .prologue
    const/4 v6, 0x0

    .line 238
    const-string v5, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v5}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v3

    .line 239
    .local v3, "saveAlbumPermission":Z
    const-string v5, "android.permission.CAMERA"

    invoke-static {p0, v5}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v4

    .line 245
    .local v4, "takePicturePermission":Z
    if-nez v4, :cond_0

    .line 246
    const/4 v4, 0x1

    .line 248
    :try_start_0
    iget-object v5, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 249
    .local v0, "packageManager":Landroid/content/pm/PackageManager;
    iget-object v5, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/16 v7, 0x1000

    invoke-virtual {v0, v5, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iget-object v2, v5, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    .line 250
    .local v2, "permissionsInPackage":[Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 251
    array-length v7, v2

    move v5, v6

    :goto_0
    if-ge v5, v7, :cond_0

    aget-object v1, v2, v5

    .line 252
    .local v1, "permission":Ljava/lang/String;
    const-string v8, "android.permission.CAMERA"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    if-eqz v8, :cond_1

    .line 253
    const/4 v4, 0x0

    .line 264
    .end local v0    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v1    # "permission":Ljava/lang/String;
    .end local v2    # "permissionsInPackage":[Ljava/lang/String;
    :cond_0
    :goto_1
    if-eqz v4, :cond_2

    if-eqz v3, :cond_2

    .line 265
    invoke-virtual {p0, p1, p2}, Lorg/apache/cordova/camera/CameraLauncher;->takePicture(II)V

    .line 273
    :goto_2
    return-void

    .line 251
    .restart local v0    # "packageManager":Landroid/content/pm/PackageManager;
    .restart local v1    # "permission":Ljava/lang/String;
    .restart local v2    # "permissionsInPackage":[Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 266
    .end local v0    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v1    # "permission":Ljava/lang/String;
    .end local v2    # "permissionsInPackage":[Ljava/lang/String;
    :cond_2
    if-eqz v3, :cond_3

    if-nez v4, :cond_3

    .line 267
    const-string v5, "android.permission.CAMERA"

    invoke-static {p0, v6, v5}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    goto :goto_2

    .line 268
    :cond_3
    if-nez v3, :cond_4

    if-eqz v4, :cond_4

    .line 269
    const-string v5, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v6, v5}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    goto :goto_2

    .line 271
    :cond_4
    sget-object v5, Lorg/apache/cordova/camera/CameraLauncher;->permissions:[Ljava/lang/String;

    invoke-static {p0, v6, v5}, Lorg/apache/cordova/PermissionHelper;->requestPermissions(Lorg/apache/cordova/CordovaPlugin;I[Ljava/lang/String;)V

    goto :goto_2

    .line 258
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 7
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v5, -0x1

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 132
    iput-object p3, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 134
    const-string v4, "takePicture"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 135
    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    .line 136
    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    .line 137
    iput-boolean v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    .line 138
    iput v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 139
    iput v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 140
    iput v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 141
    iput v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    .line 142
    const/16 v4, 0x32

    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    .line 145
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    .line 146
    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    .line 147
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    .line 148
    const/4 v4, 0x3

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 149
    const/4 v4, 0x4

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 150
    const/4 v4, 0x5

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 151
    const/4 v4, 0x6

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    .line 152
    const/4 v4, 0x7

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v4

    iput-boolean v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    .line 153
    const/16 v4, 0x8

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v4

    iput-boolean v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    .line 154
    const/16 v4, 0x9

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v4

    iput-boolean v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    .line 158
    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-ge v4, v2, :cond_0

    .line 159
    iput v5, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 161
    :cond_0
    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-ge v4, v2, :cond_1

    .line 162
    iput v5, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 167
    :cond_1
    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-ne v4, v5, :cond_2

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-ne v4, v5, :cond_2

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    const/16 v5, 0x64

    if-ne v4, v5, :cond_2

    iget-boolean v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-nez v4, :cond_2

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-ne v4, v2, :cond_2

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    if-ne v4, v2, :cond_2

    .line 169
    iput v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 173
    :cond_2
    :try_start_0
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    if-ne v3, v2, :cond_4

    .line 174
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v3, v4}, Lorg/apache/cordova/camera/CameraLauncher;->callTakePicture(II)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    :cond_3
    :goto_0
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 194
    .local v1, "r":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 195
    invoke-virtual {p3, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 199
    .end local v1    # "r":Lorg/apache/cordova/PluginResult;
    :goto_1
    return v2

    .line 176
    :cond_4
    :try_start_1
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    if-eqz v3, :cond_5

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    if-ne v3, v6, :cond_3

    .line 178
    :cond_5
    sget-object v3, Lorg/apache/cordova/camera/CameraLauncher;->permissions:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-static {p0, v3}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 179
    const/4 v3, 0x1

    const-string v4, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v3, v4}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 185
    :catch_0
    move-exception v0

    .line 187
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v3, "Illegal Argument Exception"

    invoke-virtual {p3, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 188
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 189
    .restart local v1    # "r":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p3, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1

    .line 181
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v1    # "r":Lorg/apache/cordova/PluginResult;
    :cond_6
    :try_start_2
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    iget v5, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v3, v4, v5}, Lorg/apache/cordova/camera/CameraLauncher;->getImage(III)V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :cond_7
    move v2, v3

    .line 199
    goto :goto_1
.end method

.method public failPicture(Ljava/lang/String;)V
    .locals 1
    .param p1, "err"    # Ljava/lang/String;

    .prologue
    .line 1249
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 1250
    return-void
.end method

.method public getImage(III)V
    .locals 6
    .param p1, "srcType"    # I
    .param p2, "returnType"    # I
    .param p3, "encodingType"    # I

    .prologue
    const/4 v5, 0x1

    .line 350
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 351
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "Get Picture"

    .line 352
    .local v2, "title":Ljava/lang/String;
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 353
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    if-nez v3, :cond_6

    .line 354
    const-string v3, "image/*"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 355
    iget-boolean v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v3, :cond_5

    .line 356
    const-string v3, "android.intent.action.PICK"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 357
    const-string v3, "crop"

    const-string v4, "true"

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 358
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-lez v3, :cond_0

    .line 359
    const-string v3, "outputX"

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 361
    :cond_0
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v3, :cond_1

    .line 362
    const-string v3, "outputY"

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 364
    :cond_1
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v3, :cond_2

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-lez v3, :cond_2

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-ne v3, v4, :cond_2

    .line 365
    const-string v3, "aspectX"

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 366
    const-string v3, "aspectY"

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 368
    :cond_2
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(I)Ljava/io/File;

    move-result-object v1

    .line 369
    .local v1, "photo":Ljava/io/File;
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 370
    const-string v3, "output"

    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 388
    .end local v1    # "photo":Ljava/io/File;
    :cond_3
    :goto_0
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    if-eqz v3, :cond_4

    .line 389
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v4}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v4

    add-int/lit8 v5, p1, 0x1

    mul-int/lit8 v5, v5, 0x10

    add-int/2addr v5, p2

    add-int/lit8 v5, v5, 0x1

    invoke-interface {v3, p0, v4, v5}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    .line 392
    :cond_4
    return-void

    .line 372
    :cond_5
    const-string v3, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 373
    const-string v3, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 375
    :cond_6
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    if-ne v3, v5, :cond_7

    .line 376
    const-string v3, "video/*"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 377
    const-string v2, "Get Video"

    .line 378
    const-string v3, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 379
    const-string v3, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 380
    :cond_7
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_3

    .line 383
    const-string v3, "*/*"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 384
    const-string v2, "Get All"

    .line 385
    const-string v3, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 386
    const-string v3, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 8
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v7, -0x1

    .line 738
    div-int/lit8 v6, p1, 0x10

    add-int/lit8 v4, v6, -0x1

    .line 739
    .local v4, "srcType":I
    rem-int/lit8 v6, p1, 0x10

    add-int/lit8 v0, v6, -0x1

    .line 742
    .local v0, "destType":I
    const/16 v6, 0x64

    if-lt p1, v6, :cond_3

    .line 743
    if-ne p2, v7, :cond_1

    .line 747
    add-int/lit8 v0, p1, -0x64

    .line 749
    :try_start_0
    invoke-direct {p0, v0, p3}, Lorg/apache/cordova/camera/CameraLauncher;->processResultFromCamera(ILandroid/content/Intent;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 812
    :cond_0
    :goto_0
    return-void

    .line 750
    :catch_0
    move-exception v1

    .line 751
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 752
    const-string v6, "CameraLauncher"

    const-string v7, "Unable to write to file"

    invoke-static {v6, v7}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 756
    .end local v1    # "e":Ljava/io/IOException;
    :cond_1
    if-nez p2, :cond_2

    .line 757
    const-string v6, "Camera cancelled."

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 762
    :cond_2
    const-string v6, "Did not complete!"

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 766
    :cond_3
    const/4 v6, 0x1

    if-ne v4, v6, :cond_7

    .line 768
    if-ne p2, v7, :cond_5

    .line 770
    :try_start_1
    iget-boolean v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v6, :cond_4

    .line 772
    iget v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-direct {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(I)Ljava/io/File;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    .line 773
    .local v5, "tmpFile":Landroid/net/Uri;
    invoke-direct {p0, v5, v0, p3}, Lorg/apache/cordova/camera/CameraLauncher;->performCrop(Landroid/net/Uri;ILandroid/content/Intent;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 778
    .end local v5    # "tmpFile":Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 779
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 780
    const-string v6, "Error capturing image."

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 776
    .end local v1    # "e":Ljava/io/IOException;
    :cond_4
    :try_start_2
    invoke-direct {p0, v0, p3}, Lorg/apache/cordova/camera/CameraLauncher;->processResultFromCamera(ILandroid/content/Intent;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 785
    :cond_5
    if-nez p2, :cond_6

    .line 786
    const-string v6, "Camera cancelled."

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 791
    :cond_6
    const-string v6, "Did not complete!"

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 795
    :cond_7
    if-eqz v4, :cond_8

    const/4 v6, 0x2

    if-ne v4, v6, :cond_0

    .line 796
    :cond_8
    if-ne p2, v7, :cond_9

    if-eqz p3, :cond_9

    .line 797
    move-object v3, p3

    .line 798
    .local v3, "i":Landroid/content/Intent;
    move v2, v0

    .line 799
    .local v2, "finalDestType":I
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v6

    new-instance v7, Lorg/apache/cordova/camera/CameraLauncher$1;

    invoke-direct {v7, p0, v2, v3}, Lorg/apache/cordova/camera/CameraLauncher$1;-><init>(Lorg/apache/cordova/camera/CameraLauncher;ILandroid/content/Intent;)V

    invoke-interface {v6, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 805
    .end local v2    # "finalDestType":I
    .end local v3    # "i":Landroid/content/Intent;
    :cond_9
    if-nez p2, :cond_a

    .line 806
    const-string v6, "Selection cancelled."

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 809
    :cond_a
    const-string v6, "Selection did not complete!"

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onMediaScannerConnected()V
    .locals 4

    .prologue
    .line 1263
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    iget-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->scanMe:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "image/*"

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1268
    :goto_0
    return-void

    .line 1264
    :catch_0
    move-exception v0

    .line 1265
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v1, "CameraLauncher"

    const-string v2, "Can\'t scan file in MediaScanner after taking picture"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
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
    .line 1278
    array-length v2, p3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_1

    aget v0, p3, v1

    .line 1280
    .local v0, "r":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 1282
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const/16 v4, 0x14

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1295
    .end local v0    # "r":I
    :goto_1
    return-void

    .line 1278
    .restart local v0    # "r":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1286
    .end local v0    # "r":I
    :cond_1
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 1289
    :pswitch_0
    iget v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v1, v2}, Lorg/apache/cordova/camera/CameraLauncher;->takePicture(II)V

    goto :goto_1

    .line 1292
    :pswitch_1
    iget v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v1, v2, v3}, Lorg/apache/cordova/camera/CameraLauncher;->getImage(III)V

    goto :goto_1

    .line 1286
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onRestoreStateForActivityResult(Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 1328
    const-string v0, "destType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    .line 1329
    const-string v0, "srcType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    .line 1330
    const-string v0, "mQuality"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    .line 1331
    const-string v0, "targetWidth"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 1332
    const-string v0, "targetHeight"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 1333
    const-string v0, "encodingType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 1334
    const-string v0, "mediaType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    .line 1335
    const-string v0, "numPics"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->numPics:I

    .line 1336
    const-string v0, "allowEdit"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    .line 1337
    const-string v0, "correctOrientation"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    .line 1338
    const-string v0, "saveToPhotoAlbum"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    .line 1340
    const-string v0, "croppedUri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1341
    const-string v0, "croppedUri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 1344
    :cond_0
    const-string v0, "imageUri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1345
    const-string v0, "imageUri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Landroid/net/Uri;

    .line 1348
    :cond_1
    iput-object p2, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 1349
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .locals 3

    .prologue
    .line 1303
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1304
    .local v0, "state":Landroid/os/Bundle;
    const-string v1, "destType"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1305
    const-string v1, "srcType"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1306
    const-string v1, "mQuality"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1307
    const-string v1, "targetWidth"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1308
    const-string v1, "targetHeight"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1309
    const-string v1, "encodingType"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1310
    const-string v1, "mediaType"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1311
    const-string v1, "numPics"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->numPics:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1312
    const-string v1, "allowEdit"

    iget-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1313
    const-string v1, "correctOrientation"

    iget-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1314
    const-string v1, "saveToPhotoAlbum"

    iget-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1316
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v1, :cond_0

    .line 1317
    const-string v1, "croppedUri"

    iget-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1320
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Landroid/net/Uri;

    if-eqz v1, :cond_1

    .line 1321
    const-string v1, "imageUri"

    iget-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1324
    :cond_1
    return-object v0
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1271
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 1272
    return-void
.end method

.method public processPicture(Landroid/graphics/Bitmap;I)V
    .locals 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "encodingType"    # I

    .prologue
    .line 1222
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1223
    .local v3, "jpeg_data":Ljava/io/ByteArrayOutputStream;
    if-nez p2, :cond_1

    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 1228
    .local v1, "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :goto_0
    :try_start_0
    iget v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    invoke-virtual {p1, v1, v6, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1229
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 1230
    .local v0, "code":[B
    const/4 v6, 0x2

    invoke-static {v0, v6}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v5

    .line 1231
    .local v5, "output":[B
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    .line 1232
    .local v4, "js_out":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v6, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1233
    const/4 v4, 0x0

    .line 1234
    const/4 v5, 0x0

    .line 1240
    .end local v0    # "code":[B
    .end local v4    # "js_out":Ljava/lang/String;
    .end local v5    # "output":[B
    :cond_0
    :goto_1
    const/4 v3, 0x0

    .line 1241
    return-void

    .line 1223
    .end local v1    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :cond_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_0

    .line 1237
    .restart local v1    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :catch_0
    move-exception v2

    .line 1238
    .local v2, "e":Ljava/lang/Exception;
    const-string v6, "Error compressing image."

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public takePicture(II)V
    .locals 5
    .param p1, "returnType"    # I
    .param p2, "encodingType"    # I

    .prologue
    .line 278
    invoke-direct {p0}, Lorg/apache/cordova/camera/CameraLauncher;->whichContentStore()Landroid/net/Uri;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/camera/CameraLauncher;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v3

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v3

    iput v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->numPics:I

    .line 281
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 284
    .local v0, "intent":Landroid/content/Intent;
    invoke-direct {p0, p2}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(I)Ljava/io/File;

    move-result-object v2

    .line 285
    .local v2, "photo":Ljava/io/File;
    const-string v3, "output"

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 286
    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Landroid/net/Uri;

    .line 288
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    if-eqz v3, :cond_0

    .line 290
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 291
    .local v1, "mPm":Landroid/content/pm/PackageManager;
    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 294
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    add-int/lit8 v4, p1, 0x20

    add-int/lit8 v4, v4, 0x1

    invoke-interface {v3, p0, v0, v4}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    .line 303
    .end local v1    # "mPm":Landroid/content/pm/PackageManager;
    :cond_0
    :goto_0
    return-void

    .line 298
    .restart local v1    # "mPm":Landroid/content/pm/PackageManager;
    :cond_1
    const-string v3, "CameraLauncher"

    const-string v4, "Error: You don\'t have a default camera.  Your device may not be CTS complaint."

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
