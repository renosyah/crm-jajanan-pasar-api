<div class="row">
    <div class="col s12">
        <form action="../handler/add_product.php" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="input-field col s6">
                    <input type="text" class="validate" placeholder="Nama Produk" name="name">
                </div>
                <div class="input-field col s6">
                    <input type="number" class="validate" placeholder="Harga Satuan" name="price">
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input type="text" class="validate" placeholder="Detail" name="detail">
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <h5>Stok Produk</h5>
                </div>
                <div class="input-field col s6">
                    <h5>Tanggal Expired Produk</h5>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <input type="number" class="validate" placeholder="Stok" name="stock">
                </div>
                <div class="input-field col s6">
                    <input type="date" class="validate" placeholder="Tanggal Expire" name="exp_date">
                </div>
            </div>
            <div class = "row">
                <div class = "file-field input-field">
                <div class = "waves-effect waves-light btn-large btn red darken-1 white-text"><span>Browse</span>
                    <input type = "file" accept="image/png, image/gif, image/jpeg" name="file" />
                </div>
                <div class = "file-path-wrapper">
                    <input class = "file-path validate" type = "text" placeholder = "Upload gambar produk" />
                </div>
            </div>
            <div class="center card-action">
                <br /><br />
                <button class="waves-effect waves-light btn-large btn red darken-1 white-text" style="text-transform:none;width:98%;" type="submit">
                    <b>
                        <span>Tambah</span>
                    </b>    
                </button>
            </div>
        </form>
    </div>
</div>