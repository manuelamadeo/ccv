.class Lcom/club_ciclista/valverdedejucar/MainActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/club_ciclista/valverdedejucar/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/club_ciclista/valverdedejucar/MainActivity;


# direct methods
.method constructor <init>(Lcom/club_ciclista/valverdedejucar/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$1;->a:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$1;->a:Lcom/club_ciclista/valverdedejucar/MainActivity;

    iget-object v0, v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->b:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$1;->a:Lcom/club_ciclista/valverdedejucar/MainActivity;

    iget-object v0, v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    return-void
.end method
